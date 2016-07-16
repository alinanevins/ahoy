var BadgeItem = React.createClass({
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
          <th>Badge ID</th>
          <th>Name</th>
          <th># of Users</th>
        </tr>
      </thead>
      <tbody>
        {this.makeRow()}
      </tbody>
    </table>

  );
  }
});
