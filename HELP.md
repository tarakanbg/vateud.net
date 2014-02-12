# VATEUD.net Website User Guide

_by Svilen Vassilev_

## General information for vACCs

* Things you can manage: vacc descriptions, staff listings, events and airports: they all come from the API.
All else is automated (and also coming from the API). Create your accounts there and manage the records by
either using the API web backend or programmatically via the RESTful endpoints.
* Frequencies and squawk ranges are also derived programmatically and managed by VATEUD8 (Operations Director).
Assign a [task](http://tasks.vateud.net) to him if you need frequency or squawk modification.

## General Information for editors & EUD staff

* The EUD website is essentially another frontend to the API, they're deeply integrated and share a common DB
* Manipulating the website contents requires an API account and the "Page Editor" role enabled. Contact VATEUD7
or any of the API admins for that.
* The login URL is [http://vateud.net/admin/login](http://vateud.net/admin/login)
* Some pages / menus / areas are part of the core application and not editable: i.e. events, countries/vaccs,
airports, services. Their data is derrived programatically and they "just work" (or should).
* There are __2 types of editable content:__ pages and news.
* The news are a blog-style reverse-chronological listings of articles. They're aggregated on the News page.
* Pages are a tree-like nested set (roots, children, siblings, descendants). They can be hierarchically
arranged and automatically appear in menus as defined.

## Frontend editing and tools

After logging in the app, you'll get redirected to the backend dashboard. Leave it open for convenience and
open another browser tab with the frontend (vateud.net). You'll notice, that as a logged in user you'll have
an __Admin Bar__ fixed to the bottom of the screen like this:

![adminbar](http://i.imgur.com/JLqorN3.png)

The admin bar will always be there, while you navigate the site when logged in, but its buttons will change
depending on the pages that you're looking at to reflect your abilities to edit those pages.

The Admin Panel button will always be there to allow you going to the backend.

The Logout button will always be there to let you exit the session.

The "New Page" or "New News Item" buttons, when present, will send you to the backend form for creating
a new page or new news item respectively. This is just for convenience. You have this functionality on
the backend anyway.

### Editing the page content

The "Edit text" or "Edit news item" buttons, when available, will put you in edit mode, opening an overlay
WYSIWYG editor directly on the frontend. The editable zones are outlined with light blue and you get the standard
familiar editor functionality to format the text, tables, images, links, etc:

![editor](http://i.imgur.com/Kkl8Doq.jpg?1)

When ready, remember to hit the Save button.

So, editing the website is as simple as navigating to the page you want to edit and clicking the edit button
on the adminbar. Same applies for news items.

## Backend functionality

The admin backend (http://vateud.net/admin) is used to create or delete pages and news, to edit SEO metadata and
other basic preferences for the pages/news and to rearrange page order. The backend is not used or needed for
content editing.

### Backend sections

The backend contains the following sections: dashboard, news management, pages management. On the dashboard
there's nothing useful right now and it's underdeveloped; can be used potentially to get a quick overview
of recent activity at a glance, but with only 2 backend models, this does not provide much value.

### Managing pages

The page management interface provides a listing of all existing pages together with their properties, quick
action links and search filters. To enable data liberation, there's the possiblity to download all data in
either json, xml or csv formats. Those links __are not__ public. Interface preview:

![pages](http://i.imgur.com/x1SfdHq.png)

#### Adding a new page

It's done by clicking the "Add page" button and filling in the form. The following settings / attributes
are available:

* parent: the parent page of the newly created page. If left blank the new page will be a top-level one
* title: the page title. SEO friendly Url slug will automatically be created from it
* layout: select a layout for the page. See below for explanation of the several layouts available.
* abstract: if checked the page will be treated as a blank redirect, i.e. it will have no content of its own,
and if requested will redirect to its first descendant
* visible: checked by default. If unchecked the page will be publicly inaccessible. Useful for drafts, outdated
or irrelevant pages
* menu: if checked the page will be included in the menu structure. If unchecked, the page will be accessible
with a direct link, but not included in menus
* SEO settings: name, description and keywords. Self explanatory and fully optional. Modern search engines don't
really care for those. Description and keywords are prepopulated with some generic defaults.

When created, the page will appear on the frontend and its content can be edited there. Content is not edited
on the backend.

#### (Re)ordering pages

All pages form a tree structure, much like a genealogical tree. The position of each individual page in that
tree is defined by its parent page and its position among its siblings (pages of the same level). So you can
change the page position by putting it under a different parent and/or moving it left or right in regards
to its siblings (or up and down if you prefer to think of it that way).

Changing the page's parent is done via the page edit interface. Changing its position (order) is done in page
view mode. When you open a page in view mode on the backend you'll see a section that lists that page's
parent, siblings and children (if any) and provides buttons to move the page one step per click to the left
or to the right.

Like this:

![tree](http://i.imgur.com/hEqbFqN.png)

In this example the currently active page is the orange one (Phraseology). It's currently position in the right
end of its siblings line, meaning, it's the __last__ page on this level. We have a "Move Left" button available
to make it move to the left (or higher if you prefer to think of it that way), and thus to put it between "Pilot
training introduction" and "P1 Manual". Here's how it looks after clicking that button:

![secondtree](http://i.imgur.com/SyXinPG.png)

Now the Phraseology page is in the middle, between the other two pages, it's no longer the last one. This change will
be reflected on the frontend menus as the users see them.

Also because the page is now in the middle and we can move it in either direction, we have a "Move Left" and "Move
Right" buttons. Once again, you can think of those as moving up or down, depending on what's easier on your brain :)
It doesn't matter if a tree is envisioned as a vertical structure (file manager style) or as a horizontal structure
(traditional genealogy or horizontal menu style): the position of each element and the end result is exactly the same.

Also, when editing those trees, keep in mind all those page name blocks are clickable links and you can use them
to quickly jump between the different pages (branches of the tree) and adjust them.

### Managing news

Managin the new is essentially the same as managing the pages with minor differences:

* the fields in the new/edit form are slightly different, i.e. for the news there's an author, date of posting, etc
* the date/time of new news articles is automatically recorded, but can be overriden by editing them later, if needed
* there's no tree structure for news. Only chronology.

### Versioning and history

Model versioning is implemented for both pages and news via the "paper_trail" library. Meaning every
revision made to a page or news item is recorded, together with its timestamp and the user who did it
and those versioned entires can be used as revert points if needed. There's only command line interface
for that in the initial release though, no web UI. The data however is there, and accumulating and it can be hooked
to a web UI in future revisions.

## Fragment caching

Country profiles and especially airport profiles aggregate a lot of live data, and might take a while
to load depending on how recently they have been requested previously. There's a lot of server fragment
caching going on to minimize the annoyance. The fragment caching times overlap in order to almost never
require a full data refresh and they are as follows:

* Airport charts: 6 hours
* Airport notams: 8 hours
* Skyvector embedded VFR chart: 22 hours
* Airport map: 23 hours
* Airport online listings: 5 minutes
* Airport general details: 30 minutes
* Airport metar: 10 minutes
* Country ATC frequencies: 3 hours
* Country events: 20 minutes
* Country airports: 20 minutes
* Country staff list: 20 minutes
* Squawk ranges: 12 hours
* Upcoming events (frontpage): 15 minutes
* Latest tasks (frontpage): 15 minutes
