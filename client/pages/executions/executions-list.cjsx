{ List, ListItem, FontIcon } = mui
{ Styles: { Colors } } = mui

@ExecutionsList = React.createClass
  displayName: 'ExecutionsList'

  showLogs: (logs) -> =>
    @props.onShowLogs logs

  executionItems: ->
    @props.executions.map (exec) =>
      <ListItem key={exec._id}
        leftIcon={<ResultIcon status={exec.status} passed={exec.passed}/>}
        primaryText={exec.repoUrl}
        secondaryText={moment(exec.created).fromNow()}
        onTouchTap={@showLogs exec.log}>
      </ListItem>

  render: ->
    <List className='executionsList'>
     {@executionItems()}
    </List>

@ResultIcon = React.createClass
  displayName: 'ResultIcon'

  render: ->
    if @props.status is 'done'
      if @props.passed
        <FontIcon {... @props} color={Colors.green500} className='fa fa-check status-icon passed' />
      else
        <FontIcon {... @props} color={Colors.red500} className='fa fa-times status-icon failed' />
    else
      <FontIcon {... @props} color={Colors.blue500} className='status-icon fa fa-circle-o-notch fa-spin' />
