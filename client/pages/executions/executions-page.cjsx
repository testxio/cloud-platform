{ Dialog, FlatButton, LeftNav} = mui

@ExecutionsPage = React.createClass
  displayName: 'ExecutionsPage'

  getInitialState: ->
    logs: null

  onShowLogs: (logs) ->
    @setState logs: logs

  render: ->
    <span>
      <MeteorExecutionsList onShowLogs={@onShowLogs} />
      <LeftNav width={1000} openRight={true} open={@state.logs isnt null} style={backgroundColor: 'black'}>
        {if @state.logs isnt null
          <Log content={@state.logs}/>
        }
      </LeftNav>
    </span>
