{ Dialog, FlatButton, LeftNav, Divider} = mui

@ExecutionsPage = React.createClass
  displayName: 'ExecutionsPage'

  mixins: [ReactMeteorData]

  getMeteorData: ->
    log: TestExecutions.findOne(_id: @state.execution?._id)?.log

  getInitialState: ->
    execution: null

  handleExecutionSelect: (exec) ->
    @setState execution: exec

  render: ->
    <div className='container'>
      <MeteorExecutionsList onSelect={@handleExecutionSelect} />
      {if @state.execution isnt null
        <div className='innerPage'>
          <h2>{@state.execution.repoUrl}</h2>
          <h4>{moment(@state.execution.created).format('LLL')} ({moment(@state.execution.created).fromNow()})</h4>
          <Divider />
          <Log content={@data.log}/>
        </div>
      }
    </div>
