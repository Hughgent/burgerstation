var/global/list/all_paper_data = list()

/subsystem/paper/
	name = "Paper Loader Subsystem"
	desc = "Loads html files and books."
	priority = SS_ORDER_LAST

/subsystem/paper/Initialize()

	var/initial_directory = "html/books/"
	var/list/book_list = flist(initial_directory)

	var/found_books = 0
	var/found_pages = 0

	for(var/book_directory in book_list)
		if(copytext(book_directory,-1) != "/")
			continue
		var/title = copytext(book_directory,1,-1)
		all_paper_data[title] = list()
		found_books++
		var/list/book_contents = flist(initial_directory + book_directory)
		for(var/page_directory in book_contents)
			found_pages++
			var/loaded_data = file2text(initial_directory + book_directory + page_directory)
			all_paper_data[title] += loaded_data

	LOG_SERVER("Found [found_books] books.")
	LOG_SERVER("Found [found_pages] pages.")