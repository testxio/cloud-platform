@MeteorExecutionsList = React.createClass
  displayName: 'MeteorExecutionsList'

  mixins: [ReactMeteorData]

  getMeteorData: ->
    execs: TestExecutions.find({}, {sort: created: -1}).fetch()

  render: ->
    <ExecutionsList {... @props} executions={@data.execs} />
