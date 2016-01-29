{ Dialog } = mui

@LoginDialog = React.createClass
  displayName: 'LoginDialog'

  componentDidMount: ->
   @view = Blaze.render Template.atForm, @refs.loginContainer

  componentWillUnmount: ->
   Blaze.remove @view

  handleClose: ->
   console.log 'close'

  render: ->
   <div>
     <Dialog
       actions={<span>ok</span>}
       modal={false}
       open={@props.open}
       onRequestClose={@handleClose}>
       <span ref="loginContainer" />
     </Dialog>
   </div>
