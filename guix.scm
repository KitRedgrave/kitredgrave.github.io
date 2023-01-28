(use-modules (guix packages)
             (guix licenses)
             (guix build-system gnu)
             (gnu packages)
             (gnu packages guile)
             (gnu packages guile-xyz))

(package
  (name "constructed.space")
  (version "1.0")
  (source #f) ; not needed just to create dev environment
  (build-system gnu-build-system)
  (inputs
   `(("guile" ,guile-3.0)
     ("haunt" ,haunt)))
  (synopsis "constructed.space source")
  (description "This is the source code for constructed.space")
  (home-page "https://constructed.space")
  (license gpl3+))
