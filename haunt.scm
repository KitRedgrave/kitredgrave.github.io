(use-modules (haunt artifact)
             (haunt builder assets)
             (haunt html)
             (haunt site)
             (haunt page)
             (commonmark))

(define (base-template body)
   `((doctype html)
     (head
       (meta (@ (charset "utf-8")))
       (meta (@ (name "viewport")
                (content "width=device-width, initial-scale=1")))
       (title "Awesome Haunt")
       ;; css
       (link (@ (rel "stylesheet")
                (href "static/css/terminal.min.css")))
       (body (@ (class "terminal"))
             (div (@ (class "container"))
                  ,body)))))

(define index-sxml
  (call-with-input-file "README.md"
    (lambda (port)
      (commonmark->sxml port))))

(define (index-page site posts)
  (serialized-artifact "index.html"
                       (base-template index-sxml)
                       sxml->html))

(site
 #:title "Kit Redgrave's temp website"
 #:domain "constructed.space"
 #:default-metadata
 '((author . "Kit Redgrave")
   (email  . "me@constructed.space"))
 #:readers (list)
 #:builders (list index-page
                  (static-directory "static")))
