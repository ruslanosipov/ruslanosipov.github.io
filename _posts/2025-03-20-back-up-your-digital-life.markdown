---
title: "Back up your digital life"
date: 2025-03-20 10:15:00 -0800
categories: [Productivity, Technology]
---

Our digital life increasingly exists primarily in the cloud. Documents, photos, emails, passwords: all of this resides in the cloud. And be it One Drive, iCloud, Google Drive, or Dropbox - you don't really own any of it.

We trust these companies with our digital life and take their reliability for granted, but it's worth remembering that nothing in this world is a guarantee. The likelihood of an outright failure of these services is relatively low; Google, for example, stores copies of all data in data centers across three geographic locations (often across multiple regions). Microsoft, Amazon, Apple and other giants follow equivalent policies. The real threat with this storage is bureaucracy. Your account can be erroneously flagged and banned: automated systems that constantly scan for policy violations aren't perfect and can misfire. Your account can get hacked, even with a strong password and two factor authentication. Navigating account restore process and getting access back can take weeks, months, or be altogether impossible.

Because of this, local backups are critical if you care about your data - which you probably do.

### 3-2-1 backup strategy

A common, straightforward, and widely used rule of data backups is referred to as the "3-2-1 rule":

* Keep **three** copies of your data.
* Use **two** types of media for storage.
* Keep **one** copy off-site.

![The 3-2-1 backup rule illustrated: 3 copies, across 2 medias, with 1 stored off-site.](/images/posts/3-2-1-backup-rule.png)

In fact, you'll be hard-pressed to find a cloud service provider who doesn't subscribe to some (likely more complex) variation of this rule.

We'll satisfy the 3-2-1 backup rule with a dedicated backup drive and a home computer you likely already have:

* ✔️ Keep three copies of your data: (1) in the cloud, (2) on a dedicated backup drive, and (3) on a home device you already have.
* ✔️ Use two types of media for storage: (1) in the cloud, and (2) on our backup drive.
* ✔️ Keep one copy off-site: you'll keep your backup drive at home, which is a different location from the cloud data centers.

### Use an external HDD for backups

Solid state drives - SSDs - are all the rage today: they're blazingly fast and have become relatively affordable. But you don't want an SSD for a backup: SSDs reliability isn't great when left unpowered: with the low end of failures occurring at merely the one-year mark. And since it's a backup, you'll want to leave it unpowered.

No, for this you'll want a hard drive - an HDD. We'll be trading read/write speed for reliability. External hard drives are affordable, don't need to be powered to store the data, have been around for ages, and degrade more slowly. A quality hard drive should be mostly reliable for 5-7 years, and can be repurposed to a tertiary backup storage after that. Set a reminder in the future for yourself to do that.

![A digital reminder for April 1, 2030 which says "Backup drive probably needs to be replaced (downgrade the drive to tertiary backup storage).](/images/posts/reminder-to-replace-backup-drive.png)

Finally, some data can be recovered from a failed HDD, while failed SSDs are largely unrecoverable.

Survey your space needs, and use a hard drive a few times the size for scalability. I use a [4 Tb Seagate portable HDD](https://amzn.to/4iKFIqd), and it's working just fine.

### Use an existing device for tertiary storage

You likely already have some devices you could use at home. Maybe a laptop you're currently using, or an old desktop tower you haven't plugged in for years. Using this device will help ensure reliability and longevity of your data.

If you don't have anything you can use, or your existing storage is too small - violating the 3-2-1 backup rule is better than having no backup at all. Use an external HDD, which you can downgrade to tertiary storage once you replace it in 5-7 years.

### On encryption

Encrypting or not encrypting your backups is a personal choice.

You'll likely be backing up important documents, which makes encryption critical for security. If the backup gets stolen, your whole life can be turned upside down (although this possibility still exists today if someone hacks into your cloud account).

However, because backups tend to live a long time, encryption can have downsides: tools can change, and most importantly you can forget your password. You also can't decrypt a partially recovered backup: it's all or nothing.

If you choose to encrypt, consider using established and mature open source encryption tooling like `gpg` (I wrote about [how to use GPG](https://rosipov.com/blog/gpg-usage/) all the way back in 2012).

It's not all or nothing either: you can choose to only encrypt sensitive documents, but leave less sensitive media like photos, videos, or music unencrypted.

I do not encrypt my backups because I worry about forgetting my password by the time I need to recover the backup. I have a tendency to get in my own way: I couldn't recover some writing I've backed up in 2012 because I couldn't figure out what the password was. How fun.

### Extracting data from Cloud

Internet giants allow you to download all your data in a fairly convenient manner. Google has [Google Takeout](https://takeout.google.com), which lets you download data across services (Google Drive, Photos, email, etc). Apple allows you to [request a copy of your data](https://support.apple.com/en-us/102208), and Microsoft allows you to [submit a privacy request](https://account.microsoft.com/privacy/privacy-request).

Don't forget about other service providers who store your data like email providers or password managers.

### Back up regularly

Set up a routine you'll follow. For me, it's every year. I won't follow a more rigorous backup routine, and the trade-off of losing a year worth of data is worth the convenience of infrequent backups.

As our lives become more intertwined with the digital world, protecting your data is essential. By following the 3-2-1 backup strategy and using reliable storage, you can safeguard your data against unexpected mishaps. Regular backups and smart encryption choices will help keep your digital life secure and accessible. So, take a moment to set up your backups today - you’ll thank yourself later for the peace of mind that comes with knowing your data is safe.
