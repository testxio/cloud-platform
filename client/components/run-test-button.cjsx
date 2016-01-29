{ FlatButton, RaisedButton, Popover, PopoverAnimationFromTop, TextField, ClearFix } = mui

styles =
  button:
    marginTop: 10
  popover:
    padding: 20
  repoField:
    marginRight: 20

@RunTestButton = React.createClass
  displayName: 'RunTestButton'

  runTests: ->
    @setState
      open: false
    repoUrl = @refs.repoUrl.getValue()
    configFile = @refs.configFile.getValue() or 'conf.coffee'
    params = @refs.params.getValue()
    Meteor.call 'runTests', repoUrl, configFile, params, (err, value) ->
      console.log 'testsDone', err, value

  getInitialState: ->
    open: false

  handleTouchTap: (event) ->
    @setState
      open: true
      anchorEl: event.currentTarget

  handleRequestClose: ->
    @setState
      open: false

  render: ->
    <div {... @props}>
      <RaisedButton {... @props}
        style={styles.button}
        onTouchTap={@handleTouchTap}
        primary={true}
        label="Run test"/>
      <Popover
        open={@state.open}
        anchorEl={@state.anchorEl}
        anchorOrigin={{horizontal: 'left', vertical: 'bottom'}}
        targetOrigin={{horizontal: 'left', vertical: 'top'}}
        onRequestClose={@handleRequestClose}
        animation={PopoverAnimationFromTop}>
        <div style={styles.popover}>
          <ClearFix>
            <TextField
              ref="repoUrl"
              style={styles.repoField}
              floatingLabelText="Git repo URL" />
          </ClearFix>
          <ClearFix>
            <TextField
              ref="configFile"
              style={styles.repoField}
              hintText='conf.coffee'
              floatingLabelText="Configuration file" />
          </ClearFix>
          <ClearFix>
            <TextField
              ref="params"
              style={styles.repoField}
              floatingLabelText="Run parameters" />
          </ClearFix>
          <ClearFix>
            <RaisedButton
              onTouchTap={@runTests}
              primary={true}
              label="Run"/>
          </ClearFix>
        </div>
      </Popover>
    </div>
