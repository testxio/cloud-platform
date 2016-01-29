{ AppBar, IconMenu, IconButton, SvgIcons: {NavigationMoreVert}, MenuItem, Toolbar, ToolbarGroup } = mui

@MainLayout = React.createClass

  mixins: [ReactMeteorData]

  childContextTypes:
    muiTheme: React.PropTypes.object

  getMeteorData: ->
    currentUser: Meteor.user()

  handleLogin: ->
    console.log "user logged in"

  render: ->
    if @data.currentUser
      <div>
        <AppBar
          title="TestX Cloud Platform"
          showMenuIconButton={false}
          iconElementRight={<RightIcon />}
        />
        <main>
          <Toolbar>
            <ToolbarGroup float="left">
              <RunTestButton />
            </ToolbarGroup>
          </Toolbar>
          {@props.content()}
        </main>

      </div>
    else
      <Accounts.ui.LoginFormSet redirect={@handleLogin} />

RightIcon = React.createClass
  render: ->
    <div>
      <IconMenu
        iconButtonElement={<IconButton><NavigationMoreVert /></IconButton>}
        anchorOrigin={{horizontal: 'left', vertical: 'top'}}
        targetOrigin={{horizontal: 'left', vertical: 'top'}}
      >
        <MenuItem primaryText="Settings" />
        <MenuItem primaryText="Help" />
        <MenuItem primaryText="Sign out" onTouchTap={Meteor.logout} />
      </IconMenu>
    </div>
