var TransitionItem = React.createClass({
  propTypes: {
    data: React.PropTypes.array
  },

  makeRow: function(obj){
    var rowItem =[];
    for(var i =0;i<this.props.data.length;i++){
      var entry = this.props.data[i]
      item = (
        <tr>
          <td>{entry[0]}</td>
          <td>{entry[1]}</td>
          <td>{entry[2]}</td>
          <td>{entry[3]}</td>
          <td>{entry[4]}</td>
          <td>{entry[5]}</td>
          <td>{entry[6]}</td>
        </tr>
      );
      rowItem.push(item);
    }
    return rowItem;
  },

  render: function() {
    return(
    <table class="u-full-width">
      <thead>
        <tr>
          <th>Transition ID</th>
          <th>Team Member</th>
          <th>Date</th>
          <th>Faculty Name</th>
          <th>Course</th>
          <th>Link</th>
          <th>Date Added</th>
        </tr>
      </thead>
      <tbody>
        {this.makeRow()}
      </tbody>
    </table>

  );
  }
});
