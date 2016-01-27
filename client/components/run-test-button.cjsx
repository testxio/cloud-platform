{ FlatButton, RaisedButton, Popover, PopoverAnimationFromTop, TextField } = mui

styles =
  popover:
    padding: 20
  repoField:
    marginRight: 20

@RunTestButton = React.createClass
  displayName: 'RunTestButton'

  runTests: ->
    @setState
      open: false
    Meteor.call 'runTests', @refs.repoUrl.getValue(), (err, value) ->
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
          <TextField
            ref="repoUrl"
            style={styles.repoField}
            floatingLabelText="Git repo URL" />
          <RaisedButton
            onTouchTap={@runTests}
            primary={true}
            label="Run"/>
        </div>
      </Popover>
    </div>
