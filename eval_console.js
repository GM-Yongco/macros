// =======================================================================
// Author				: CeLaV #BeSomeoneWhoCanStandByShinomiya
// Date					: ur my date uwu
// Description			: code that will impress you
// Actual Description	: this is the collated and summarized eval js to paste into the console; 
// 		born out of procrastination and refusal to do this shite
// =======================================================================

// button area
// change this variable to either true or false depending on the review
const good_review = true
document.querySelectorAll('tr').forEach(row => {
	// Find all input elements within the row
	const inputs = row.querySelectorAll('input[type="radio"]');
	x = good_review ? (inputs.length - 1) : 0;
	if (inputs.length) {
		inputs[x].checked = true;
	}
});

// review area
// just change your responses here if you want custom
document.getElementById('comments_0__Remarks')
.value = 'I learned a lot';
document.getElementById('comments_1__Remarks')
.value = 'Needs better pacing';
document.getElementById('comments_2__Remarks')
.value = 'Overall positive';
document.getElementById('comments_3__Remarks')
.value = 'Would recommend';