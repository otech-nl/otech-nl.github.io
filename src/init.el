;;; init.el --- settings for org-static-blog
;; See https://github.com/bastibe/org-static-blog/

(defun read-file (filePath)
  "Return FILEPATH's file content."
  (with-temp-buffer
    (insert-file-contents filePath)
    (buffer-string)))

(setq blog-root "s:/src/otech-nl.github.io/")

(setq org-static-blog-publish-title "OTech BV")
(setq org-static-blog-publish-url "https://otech.nl/")
(setq org-static-blog-publish-directory blog-root)
(setq org-static-blog-posts-directory (concat blog-root "src/posts/"))
(setq org-static-blog-drafts-directory (concat blog-root "src/drafts/"))
(setq org-static-blog-index-file "blog.html")
(setq org-static-blog-enable-tags t)
(setq org-export-with-toc nil)
(setq org-export-with-section-numbers nil)

(setq org-static-blog-page-header (read-file "templates/page-header.html"))
(setq org-static-blog-page-preamble (read-file "templates/page-preamble.html"))
(setq org-static-blog-page-postamble (read-file "templates/page-postamble.html"))

;; override functions

;; I want an extra hr
(defun org-static-blog-post-preamble (post-filename)
  "Returns the formatted date and headline of the post.
This function is called for every post and prepended to the post body.
Modify this function if you want to change a posts headline."
  (concat
   "<hr/>"
   "<div class=\"post-date\">" (format-time-string "%d %b %Y" (org-static-blog-get-date post-filename)) "</div>"
   "<h1 class=\"post-title\">"
   "<a href=\"" (org-static-blog-get-url post-filename) "\">" (org-static-blog-get-title post-filename) "</a>"
   "</h1>\n"))

(provide 'init)
;;; init.el ends here
