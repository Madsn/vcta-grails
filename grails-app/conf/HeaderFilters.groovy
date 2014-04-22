
class HeaderFilters {
	private static final String HEADER_PRAGMA = "Pragma";
	private static final String HEADER_EXPIRES = "Expires";
	private static final String HEADER_CACHE_CONTROL = "Cache-Control";
	
	def filters = {
		addHeader(uri: '(/*|/)') {
			after = {
				response.setHeader(HEADER_PRAGMA, "no-cache");
				response.setDateHeader(HEADER_EXPIRES, 1L);
				response.setHeader(HEADER_CACHE_CONTROL, "no-cache");
				response.addHeader(HEADER_CACHE_CONTROL, "no-store");
			}
		}
	}
}
