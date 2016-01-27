{ AppBar } = mui

@MainLayout = React.createClass

  childContextTypes:
    muiTheme: React.PropTypes.object

  render: ->
    <div>
      <AppBar
        title="TestX Cloud Platform"
        showMenuIconButton={false}
        iconElementRight={<RunTestButton />}
      />
      <main>
        {@props.content()}
      </main>

    </div>
