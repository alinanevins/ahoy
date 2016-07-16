/*global $ */
$(function () {

  $('.datetimepicker').datetimepicker({
  	controlType: 'select',
  	oneLine: true,
  	timeFormat: 'hh:mm tt'
  });

  $('.welcome .container#navBar').hide();

  $(".close").on("click", function() {
    var thingToClose = $(this).parent();
    thingToClose.hide();
  });

  // close = document.getElementById("close");
  // close.addEventListener('click', function() {
  //   alert = document.getElementById("alert");
  //   notice = document.getElementById("notice");
  //
  //   if (alert) {
  //     alert.style.display = 'none';
  //   }
  //   if (notice) {
  //     notice.style.display = 'none';
  //   }
  // }, false);

  var all_schools = [
    "Divinity School",
    "Law School",
    "School of Architecture",
    "School of Art",
    "School of Drama",
    "School of Engineering and Applied Science",
    "School of Forestry & Environmental Studies",
    "School of Management",
    "School of Medicine",
    "School of Music",
    "School of Nursing",
    "School of Public Health",
    "Yale College"
  ];
  $( ".all_schools" ).autocomplete({
    source: all_schools
  });

  var all_depts = [
    "African American Studies",
    "American Studies",
    "Anthropology",
    "Applied Physics",
    "Astronomy",
    "Biomedical Engineering",
    "Chemical and Environmental Engineering",
    "Chemistry",
    "Classics",
    "Comparative Literature",
    "Computer Science",
    "East Asian Languages and Literatures",
    "Ecology and Evolutionary Biology",
    "Economics",
    "Electrical Engineering",
    "English",
    "Film and Media Studies Program",
    "French",
    "Geology and Geophysics",
    "Germanic Languages and Literatures",
    "History",
    "History of Art",
    "Humanities Program",
    "Italian",
    "Judaic Studies Program",
    "Linguistics",
    "Mathematics",
    "Mechanical Engineering and Materials Science",
    "Molecular Biophysics and Biochemistry",
    "Molecular, Cellular and Developmental Biology",
    "Music",
    "Near Eastern Languages and Civilizations",
    "Philosophy",
    "Physics",
    "Political Science",
    "Psychology",
    "Religious Studies",
    "Slavic Languages and Literatures",
    "Sociology",
    "Spanish and Portuguese",
    "Statistics",
    "Theater Studies Program",
    "Women’s, Gender, and Sexuality Studies",
  ];
  $( ".all_depts" ).autocomplete({
    source: all_depts
  });
});
