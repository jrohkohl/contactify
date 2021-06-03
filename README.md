# README

Thanks for taking a look at this!

A couple of questions:

* Is there any good way to add js to ransack?  Trying to get it to find without reloading.  I've heard re-rendering
the contact loop on click could work.  What would that look like?

* In terms of adding contacts/groups I had to be clever to get them to adjust all the others in the grid
so i layered an index to identify what is "0" and then put the new one before it. This does come with risk though
as if a user deletes "contact_card_0" then the code won't run.  is there a better way to work this?


