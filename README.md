# Title Nine API

This project watches for changes in [Joshua Eaton's record of open Title IX investigations][project], and updates a small data API appropriately.

[project]: https://github.com/joshua-eaton/Title-IX-investigations


### Caveat

At the moment, this is geared toward developers. If you open these URLs in your browser, unless you have a JSON viewer extension installed (like JSONView) and configured to display the JSONAPI.org media type `application/vnd.api+json`, you may be prompted to download a file of the data.

We're working on making this applicable to a broader audience, but our first use case is the API.


# Examples

__Get all cases__

https://title-nine.herokuapp.com/cases

This will return a page of 25 cases. Links to more pages are at the bottom, below the `total` case count.


__Get all cases in Massachusetts__

https://title-nine.herokuapp.com/cases?filter[state]=MA

Add the `filter[state]=` with the two-letter abbreviation of the state you're looking for.


__Get open cases in New Hampshire__

https://title-nine.herokuapp.com/cases?filter[status]=open&filter[status]=NH

Options for statuses are `open` and `closed`.


__Get all cases at Dartmouth College__

https://title-nine.herokuapp.com/cases?filter[institution]=DARTMOUTH%20COLLEGE

The institution names are in all caps, and not immediately apparent. At the moment, we don't have full-text search (help us add it?), so you can't send 'HARVARD' and get all the cases for Harvard's various sub-schools.

> Tech note: The %20 is how browsers represent spaces. If you typed the space into your browser, that would be fine.


# Metadata

- `institution`: all-caps name of school
- `state`: two-letter abbreviation
- `status`: 'open' or 'closed', indicating whether the investigation is ongoing
- `opened-at`: when the DOE states the case was opened
- `updated-at`: the last time this case data was updated -- that is, the last time this program looked through the data and saw this case still in the data sheet we source from
- `closed-at`: When the case was closed. This is a best guess: we mark a case as 'closed' when it's no longer on the data sheet we pull our information from. If this date is `null`, it's not closed.

Dates are in the format YYYY-MM-DD, and times are in Eastern Time.



# Roadmap

- Add Institution and State as models.
- Add filters on institution, state, and date attributes.
- Geolocate institutions to support mapping applications of this data.

# Contributing

Contact [Joshua Eaton][contact] if you'd like to get involved with this project in any way -- be it using the data, contributing code, or anything else.

[contact]: https://twitter.com/joshua_eaton