{ Table, TableBody, TableFooter, TableHeader, TableHeaderColumn, TableRow, TableRowColumn, FontIcon } = mui
{ Styles: { Colors } } = mui

@ExecutionsList = React.createClass
  displayName: 'ExecutionsList'

  tableRows: ->
    @props.executions.map (exec) =>
      <TableRow key={exec._id}>
        <TableRowColumn>{exec.repoUrl}</TableRowColumn>
        <TableRowColumn>{new Date(exec.created).toString()}</TableRowColumn>
        <TableRowColumn>
          <ResultIcon status={exec.status} passed={exec.passed}/>
        </TableRowColumn>
      </TableRow>

  render: ->
    <Table heigh={300}>
      <TableHeader displaySelectAll={false} adjustForCheckbox={false}>
        <TableRow>
          <TableHeaderColumn>Repo URL</TableHeaderColumn>
          <TableHeaderColumn>Created</TableHeaderColumn>
          <TableHeaderColumn>Result</TableHeaderColumn>
        </TableRow>
      </TableHeader>
      <TableBody showRowHover={true} displayRowCheckbox={false} selectable={false}>
        {@tableRows()}
      </TableBody>
    </Table>


@ResultIcon = React.createClass
  displayName: 'ResultIcon'

  render: ->
    if @props.status is 'done'
      if @props.passed
        <i style={color:Colors.green500} className="fa fa-check status-icon passed"></i>
      else
        <i style={color:Colors.red500} className="fa fa-times status-icon failed"></i>
    else
      <i style={color:Colors.blue500} className="status-icon fa fa-circle-o-notch fa-spin"></i>
