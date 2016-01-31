@Log = React.createClass

  render: ->
    <pre className='log'
      dangerouslySetInnerHTML={{__html: ansi_up.ansi_to_html @props.content}} />
