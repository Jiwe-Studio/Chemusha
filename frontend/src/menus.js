
export const AppMenus = {
    
	QuestionsTableHeaderItems: [
  {
    "label": "Username",
    "align": "left",
    "sortable": false,
    "name": "username",
    "field": "username"
  },
  {
    "label": "Points",
    "align": "left",
    "sortable": false,
    "name": "points",
    "field": "points"
  },
  {
    "label": "Date",
    "align": "left",
    "sortable": false,
    "name": "date",
    "field": "date"
  }
],
	QuestionsTableHeader2Items: [
  {
    "label": "Id",
    "align": "left",
    "sortable": false,
    "name": "id",
    "field": "id"
  },
  {
    "label": "User Id",
    "align": "left",
    "sortable": false,
    "name": "user_id",
    "field": "user_id"
  },
  {
    "label": "Points",
    "align": "left",
    "sortable": false,
    "name": "points",
    "field": "points"
  },
  {
    "label": "Date",
    "align": "left",
    "sortable": false,
    "name": "date",
    "field": "date"
  },
  {
    "label": "Username",
    "align": "left",
    "sortable": false,
    "name": "username",
    "field": "username"
  },
  {
    "label": "Action",
    "align": "right",
    "sortable": false,
    "name": "btnactions",
    "field": ""
  }
],
	QuestionsTableHeader2Items: [
  {
    "label": "User Id",
    "align": "left",
    "sortable": false,
    "name": "user_id",
    "field": "user_id"
  },
  {
    "label": "Points",
    "align": "left",
    "sortable": false,
    "name": "points",
    "field": "points"
  },
  {
    "label": "Date",
    "align": "left",
    "sortable": false,
    "name": "date",
    "field": "date"
  },
  {
    "label": "Action",
    "align": "right",
    "sortable": false,
    "name": "btnactions",
    "field": ""
  }
],
	LeaderboardTableHeaderItems: [
  {
    "label": "Id",
    "align": "left",
    "sortable": false,
    "name": "id",
    "field": "id"
  },
  {
    "label": "Name",
    "align": "left",
    "sortable": false,
    "name": "name",
    "field": "name"
  },
  {
    "label": "Rank",
    "align": "left",
    "sortable": false,
    "name": "rank",
    "field": "rank"
  },
  {
    "label": "Points",
    "align": "left",
    "sortable": false,
    "name": "points",
    "field": "points"
  },
  {
    "label": "User Id",
    "align": "left",
    "sortable": false,
    "name": "user_id",
    "field": "user_id"
  },
  {
    "label": "Action",
    "align": "right",
    "sortable": false,
    "name": "btnactions",
    "field": ""
  }
],
	UsersTableHeaderItems: [
  {
    "label": "Id",
    "align": "left",
    "sortable": false,
    "name": "id",
    "field": "id"
  },
  {
    "label": "Username",
    "align": "left",
    "sortable": false,
    "name": "username",
    "field": "username"
  },
  {
    "label": "Email",
    "align": "left",
    "sortable": false,
    "name": "email",
    "field": "email"
  },
  {
    "label": "Mobile",
    "align": "left",
    "sortable": false,
    "name": "mobile",
    "field": "mobile"
  },
  {
    "label": "Action",
    "align": "right",
    "sortable": false,
    "name": "btnactions",
    "field": ""
  }
],
	MainhomeTableHeaderItems: [
  {
    "label": "Id",
    "align": "left",
    "sortable": false,
    "name": "id",
    "field": "id"
  },
  {
    "label": "Action",
    "align": "right",
    "sortable": false,
    "name": "btnactions",
    "field": ""
  }
],
	TestTableHeaderItems: [
  {
    "label": "Id",
    "align": "left",
    "sortable": false,
    "name": "id",
    "field": "id"
  },
  {
    "label": "Post",
    "align": "left",
    "sortable": false,
    "name": "post",
    "field": "post"
  },
  {
    "label": "Action",
    "align": "right",
    "sortable": false,
    "name": "btnactions",
    "field": ""
  }
],
	navbarSideLeftItems: [
  {
    "path": "/mainhome",
    "label": "Home",
    "icon": "las la-home",
    "iconcolor": "",
    "target": "",
    "submenu": []
  },
  {
    "path": "/users",
    "label": "Users",
    "icon": "las la-user-friends",
    "iconcolor": "",
    "target": "",
    "submenu": []
  },
  {
    "path": "/questions/manage_leaderboard",
    "label": "Manage LeaderBoard",
    "icon": "las la-user-graduate",
    "iconcolor": "",
    "target": "",
    "submenu": []
  }
],
	navbarTopLeftItems: [],
	navbarTopRightItems: [],

    exportFormats: {
        print: {
			label: 'Print',
			color: 'blue',
            icon: 'las la-print',
            id: 'print',
            ext: '',
        },
        pdf: {
			label: 'Pdf',
			color: 'red',
            icon: 'las la-file-pdf',
            id: 'pdf',
            ext: 'pdf',
        },
        excel: {
			label: 'Excel',
			color: 'green',
            icon: 'las la-file-excel',
            id: 'excel',
            ext: 'xlsx',
        },
        csv: {
			label: 'Csv',
			color: 'teal',
            icon: 'las la-file-csv',
            id: 'csv',
            ext: 'csv',
        },
    },
    
}