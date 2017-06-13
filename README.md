# walletdecryptor

#### TL;DR

Tested on mac, with openssl installed (i think its default anyway.)

1. Encrypt your wallet using something along these lines

`openssl des -in insurewallet.json -out mysecurewallet.json.enc`

2. Change lines 2-6 to your liking (only change line 6 if you know what you're doing)
3. chmod +x and run the script with the files in the right places.
4. ???
5. Profit

#### What? that didn't explain things enough!

Ok..

If you're anything like me, you want easy access to your wallet JSON file, but dont want to be throwing an unencrypted (albeit password protected..) file around with you, on your dropbox, or wherever.

This simple script will help with this.

#### Ok.. how do i use it?

First, encrypt your wallet using openssl, with a command line _something_ like this

`openssl des -in insecurewallet.json -out securewallet.json.enc`

The 'in' file needs to be your unencrypted wallet. The "out" can be whatever you like, but this is where your encrypted wallet will end up.

Running that command will ask you for a password. Pick a strong password.. cos why would you pick a weak one?

Anyway, after that, open up the `getwallet.sh` from this repo and change lines 2 and 3.

Line 2 should be where your encrypted wallet will live (e.g ~/Dropbox/mywallet.json.enc) and line 3 to where you want to decrypt you wallet to (e.g ~/Desktop/wallet.dec). A good idea would be to make this somewhere easily accessible so you can load MEW and throw the json at it.

Ok, we're nearly there. From here you can `chmod +x getwallet.sh` and then run `./getwallet.sh` at your whim. For extra points, stick the script somewhere and set up an alias to use it.

#### Hey, sounds simple enough..

Well, thats the idea... As an ADDED BONUS, you can pick from 2 modes by changing line 4 (and possibly 5 depending on which mode you want) to either `TIMED` or `WAIT`

##### TIMED

After an amount of time you can define (on line 5!), the wallet will be deleted using rm -P which is as secure of a delete as you can do without external tools.

##### WAIT

The script will wait for you to press ENTER before deleting the decrypted wallet.


###### Why are you so paranoid?

Why aren't you MORE paranoid?


###### Hey this is really cool can i send you some money?

Really? Wow, thanks, you're so kind.. You can send me eth at

```0x57ee46De7FCc68A5A93A69e3Cd199Dd3Aa099145```


###### Disclaimer

I have tested this on a Mac. I can't vouch for it working anywhere else. I take no responsibility for your actions while using this tool. Always keep a backup of your original files somewhere safe. Yada yada yada.

