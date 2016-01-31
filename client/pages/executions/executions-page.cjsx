{ Dialog, FlatButton, LeftNav} = mui

@ExecutionsPage = React.createClass
  displayName: 'ExecutionsPage'

  getInitialState: ->
    execution: null

  handleExecutionSelect: (exec) ->
    @setState execution: exec

  render: ->
    <div className='container'>
      <MeteorExecutionsList onSelect={@handleExecutionSelect} />
      {if @state.execution isnt null
        <Log content={@state.execution.log}/>
      }
    </div>
