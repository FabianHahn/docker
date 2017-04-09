#!/bin/sh
PERCENT=$1
USER=$2
cat << EOF | /usr/lib/dovecot/dovecot-lda -d $USER -o "plugin/quota=maildir:User quota:noenforcing"
From: postmaster@mail.hahn.graphics
To: $USER
To: postmaster@mail.hahn.graphics
Subject: Quota warning for $USER

Your mailbox for your user $USER on mail.hahn.graphics is now $PERCENT% full.

If your mailbox becomes larger than 100%, all incoming emails will be returned to their sender until you clean up your mailbox. Make sure you actually delete old messages and not just mark them as deleted and/or move them to the trash folder.
EOF
