var Dashboard = React.createClass({

  getInitialState: function() {
   return {table: NaN,data: NaN};
 },


  consultationClick: function(e){

    e.preventDefault();
    this.setState({
      table: 'Consultation'
    });
  },

  makeTable: function(){
      switch (this.state.table) {
    case 'Consultation':
      this.doAjax(this.state.table);
      return <ConsultationItem data={this.state.data}/>
      break;
    default:
      break;
      }

  },

  onSuccess: function(response){
    this.setState({data: response})
    debugger;
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
          <button className="button-primary" onClick={this.consultationClick}>Consultations</button>
        </div>
        <div className="two columns">
          <button className="button-primary" onClick={this.consultationClick}>Documentations</button>
        </div>
        <div className="two columns">
          <button className="button-primary" onClick={this.consultationClick}>Observations</button>
        </div>
        <div className="two columns">
          <button className="button-primary" onClick={this.consultationClick}>Presentations</button>
        </div>
        <div className="two columns">
          <button className="button-primary" onClick={this.consultationClick}>Transitions</button>
        </div>
        <div className="two columns">
          <button className="button-primary" onClick={this.consultationClick}>Badges</button>
        </div>
      </div>
      <div className="row">
        {this.makeTable()}
      </div>
    </div>
    );
  }
});
