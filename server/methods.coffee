Meteor.methods

  runTests: (repoUrl) ->
    console.log 'runTests', repoUrl

    # docker run -e REPO=https://github.com/testxio/testx-quickstart.git --volume $PWD/tmpwork:/work testx/cloud-runner
    docker = new Docker()
    createOpts =
      'Env': ["REPO=#{repoUrl}"]

    id = TestExecutions.insert
      created: new Date()
      repoUrl: repoUrl
      createOpts: createOpts
      status: 'executing'

    docker.run 'testx/cloud-runner', [], process.stdout, createOpts, Meteor.bindEnvironment  (err, data, container) ->
      console.log 'done', err, data, container
      passed = data.StatusCode is 0
      TestExecutions.update id, $set: {status: 'done', passed: passed}

    id
