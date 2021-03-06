
class HeaderFilters {
	private static final String HEADER_PRAGMA = "Pragma";
	private static final String HEADER_EXPIRES = "Expires";
	private static final String HEADER_CACHE_CONTROL = "Cache-Control";
	
	def filters = {
		all(controller: '*', action: '*') {
			before = {
				response.setHeader(HEADER_PRAGMA, "no-cache");
				response.setDateHeader(HEADER_EXPIRES, -1);
				response.setHeader(HEADER_CACHE_CONTROL, "no-cache");
				response.addHeader(HEADER_CACHE_CONTROL, "no-store");
			}
		}
	}
}
