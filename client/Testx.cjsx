@Testx = React.createClass

  runTests: ->
    Meteor.call 'runTests', @refs.repoUrl.value, (err, value) ->
      console.log 'testsDone', err, value

  render: ->
    <div className='page' style={textAlign:'center'}>
      <h1>Testx</h1>
      <input ref='repoUrl' style={width:'100%'} defaultValue='https://github.com/testxio/testx-quickstart.git'/>
      <br /><br />
      <button id='runTestsButton' onClick={@runTests}>Run Tests</button>
      <TestExecView />
    </div>


@TestExecView = React.createClass

  mixins: [ReactMeteorData]

  getMeteorData: ->
    testExecutions: TestExecutions.find({}, sort: {created: -1}).fetch()

  renderStatus: (e) ->
    if e.passed
      <i className="fa fa-check status-icon passed "></i>
    else
      <i className="fa fa-times status-icon failed"></i>

  renderSpinner: ->
    <i className="fa fa-circle-o-notch fa-spin status-icon"></i>

  render: ->
    <span>
      {@data.testExecutions.map (e) =>
        <div className='test-execution' key={e._id}>
          {e.repoUrl} <br />
          <span style={fontSize:12}>{e._id}</span>
          { if e.status isnt 'done' then @renderSpinner() }
          { if e.status is 'done' then @renderStatus(e) }
        </div>
      }
    </span>
