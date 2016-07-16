var Dashboard = React.createClass({

  getInitialState: function() {
   return {table: NaN,data: NaN};
 },


  consultationClick: function(e){
    e.preventDefault();

    this.setState({
      table: 'Consultation'
    }, function() {
      this.doAjax(this.state.table);
    });
  },

  documentationClick: function(e){
    e.preventDefault();

    this.setState({
      table: 'Documentation'
    }, function() {
      this.doAjax(this.state.table);
    });
  },

  presentationClick: function(e){
    e.preventDefault();

    this.setState({
      table: 'Presentation'
    }, function() {
      this.doAjax(this.state.table);
    });
  },

  transitionClick: function(e){
    e.preventDefault();

    this.setState({
      table: 'Transition'
    }, function() {
      this.doAjax(this.state.table);
    });
  },

  badgeClick: function(e){
    e.preventDefault();

    this.setState({
      table: 'Badge'
    }, function() {
      this.doAjax(this.state.table);
    });
  },

  makeTable: function(){
    // if this.state.data
      switch (this.state.table) {
    case 'Consultation':
      return <ConsultationItem data={this.state.data}/>;
    case 'Documentation':
      return <DocumentationItem data={this.state.data}/>;
    case 'Presentation':
      return <PresentationItem data={this.state.data}/>;
    case 'Transition':
      return <TransitionItem data={this.state.data}/>;
    case 'Badge':
      return <BadgeItem data={this.state.data}/>;
      break;
    default:
      break;
      }

  },

  onSuccess: function(response){
    this.setState({data: response});
  },

  doAjax: function(table){
    var address = "/dashboard/"+table
    $.ajax({
    type: "GET",
    url: address,
    dataType: 'json',
    success: this.onSuccess
    });
  },

  render: function() {
    return (
    <div className="container">
      <div className="row">
        <div className="two columns">
          <button className="button-primary dash-buttons" onClick={this.consultationClick}>Consultations</button>
        </div>
        <div className="two columns">
          <button className="button-primary dash-buttons" onClick={this.documentationClick}>Documentations</button>
        </div>
        <div className="two columns">
          <button className="button-primary dash-buttons" onClick={this.presentationClick}>Presentations</button>
        </div>
        <div className="two columns">
          <button className="button-primary dash-buttons" onClick={this.transitionClick}>Transitions</button>
        </div>
        <div className="two columns">
          <button className="button-primary dash-buttons" onClick={this.badgeClick}>Badges</button>
        </div>
      </div>
      <div className="row">
        {this.makeTable()}
      </div>
    </div>
    );
  }
});
