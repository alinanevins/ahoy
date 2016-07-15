var ConsultationItem = React.createClass({
  propTypes: {
    data: React.PropTypes.array,
    action: React.PropTypes.string
  },

  makeRow: function(obj){
debugger;
return (<td>Stub</td>);
  },

  render: function() {
    return(
    <table class="u-full-width">
      <thead>
        <tr>
          <th>Consultation ID</th>
          <th>CTL Consultant</th>
          <th>Consultation Date</th>
          <th>Consultation Focus</th>
          <th>Link to Consultation Notes</th>
        </tr>
      </thead>
      <tbody>
        {this.makeRow()}
      </tbody>
    </table>

  );
  }
});
