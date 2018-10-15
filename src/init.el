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
(setq org-static-blog-post-postamble (read-file "templates/post-comments.html"))
(setq org-static-blog-page-postamble (read-file "templates/page-postamble.html"))

;; override functions

(defun org-static-blog-post-preamble (post &optional is_post)
  "Overridden: only show date on full page"
  (if is_post (org-static-blog-post-html-date post)) "")


(defun org-static-blog-post-postamble (post &optional is_post)
  "Overridden: only show postamble on full page"
  (if is_post
      (concat
       (org-static-blog-post-taglist post)
       org-static-blog-post-postamble)
    ""
    ))

(provide 'init)
;;; init.el ends here
