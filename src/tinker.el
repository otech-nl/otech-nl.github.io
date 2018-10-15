(defun org-static-blog-regexp (regexp)
  (goto-char (point-min))
  (search-forward-regexp regexp)
  (match-string 1))

(defun org-static-blog-get-blog (post-filename)
  "Read a blog file and process it"
  (with-temp-buffer
    (insert-file-contents post-filename)
    (list :filename post-filename
          ;; :content (buffer-string)
          :title (org-static-blog-regexp "^\\#\\+title:[ ]*\\(.+\\)$")
          :date (org-static-blog-regexp "^\\#\\+date:[ ]*<\\([^]>]+\\)>$")
          :tags (split-string (org-static-blog-regexp "^\\#\\+filetags:[ ]*\\(.+\\)$"))
          ;; :html (org-export-as 'org-static-blog-post-bare nil nil nil nil)
    )))

(setq blog (org-static-blog-get-blog "drafts/index.org"))

(get blog :tags)

(message blog)
(setq x
      (("mary" . ((+ 10 21)))
       ("john" . 24)
       ("smith" . 33)))

;; get the pair with key "john"
(assoc "mary" x)

;; p-list
(setq p (list :attr1 (+ 1 1)
              :attr2 2
              :attr3 3))

(get 'p :attr1)
