Meteor.methods

  runTests: (repoUrl, configFile, params = '') ->
    console.log 'runTests', repoUrl

    repoUrl = repoUrl or 'https://github.com/testxio/testx-quickstart.git'
    # docker run -e REPO=https://github.com/testxio/testx-quickstart.git --volume $PWD/tmpwork:/work testx/cloud-runner
    docker = new Docker()
    createOpts =
      'Env': ["REPO=#{repoUrl}", "CONF_FILE=#{configFile}", "PARAMS=#{params}"]

    id = TestExecutions.insert
      created: new Date()
      repoUrl: repoUrl
      createOpts: createOpts
      status: 'executing'
      log: ''

    runner = 'testx/cloud-runner'
    docker.pull runner, Meteor.bindEnvironment (err, stream) ->
      if err then console.error err
      else
        logger = Npm.require('stream').Writable(decodeStrings: false)
        log = ''
        logger._write = Meteor.bindEnvironment (chunk, enc, next) ->
          log += chunk
          TestExecutions.update id, $set: {log: log}
          next()
        docker.run runner, [], logger, createOpts, Meteor.bindEnvironment (err, data, container) ->
          console.log 'done', err, data, container
          passed = data.StatusCode is 0
          TestExecutions.update id, $set: {status: 'done', passed: passed}

    id
