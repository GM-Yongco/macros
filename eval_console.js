// =======================================================================
// Author				: CeLaV #BeSomeoneWhoCanStandByShinomiya
// Date					: ur my date uwu
// Description			: code that will impress you
// Actual Description	: this is the collated and summarized eval js to paste into the console; 
// 		born out of procrastination and refusal to do this shite
// =======================================================================

// button area
const values = [4, 8, 12, 22];
// use this one if you dont like the professor
// and comment out the other one
// const values = [1, 5, 9, 13]

values.forEach(n => {
document
.querySelectorAll(`input[type="radio"][value^="${n}"]`)
.forEach(radio => radio.checked = true);
});

// just change your responses here if you want custom
document.getElementById('comments_0__Remarks')
.value = 'I learned a lot';
document.getElementById('comments_1__Remarks')
.value = 'Needs better pacing';
document.getElementById('comments_2__Remarks')
.value = 'Overall positive';
document.getElementById('comments_3__Remarks')
.value = 'Would recommend';

// sum random radio thats here for some reason
document
.querySelectorAll('input[type="radio"][value="1"]')
.forEach(radio => radio.checked = true);