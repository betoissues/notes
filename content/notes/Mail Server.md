+++
slug = 'mail-server'
tags = ['published']
title = 'Mail Server'
+++

## Sieve Rules

**Moving to a specific folder based on mailing list**

````lua
require ["fileinto"];

if header :contains "X-Mailing-List" "linux-kernel@vger.kernel.org" {
   	fileinto "linux/kernel";
} elsif header :contains "X-Mailing-List" "linux-btrfs@vger.kernel.org" {
	fileinto "linux/btrfs";
} elsif address :is "From" "newsletter@nixers.net" {
	fileinto "nixers";
}
````
