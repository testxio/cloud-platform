@Log = React.createClass

  render: ->
    <pre style={padding:10, color:'white'} dangerouslySetInnerHTML={{__html: ansi_up.ansi_to_html @props.content}} />
