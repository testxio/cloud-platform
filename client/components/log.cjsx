@Log = React.createClass

  componentDidMount: ->
    @log = jQuery '#exec-log'

  componentDidUpdate: ->
    @log.scrollTop @log.prop("scrollHeight")

  render: ->
    <pre id='exec-log' className='log'
      dangerouslySetInnerHTML={{__html: ansi_up.ansi_to_html @props.content}} />
