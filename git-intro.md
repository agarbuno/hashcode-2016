## Installation 

For Windows users just follow the instructions [here](https://desktop.github.com/), for linux users install it with `apt-get` that is  
```
$ sudo apt-get install git
```

## Concepts & Terminology  

Some concepts we are going to be using, probably it is going to be the first time you see them. These are: 

**Command Line**: The computer program we use to input ``Git`` commands. On a Mac or a Linux machine (any distro), it’s called Terminal. On a PC, it’s a non-native program that you have to download when using ``Git``. In both cases, you type text-based commands into the screen, instead of using a mouse and a user-friendly graphical interface.  

**Repository**: A directory or storage space where projects live, a.k.a. “*repo*”. It can be local to a folder on your computer, or it can be a storage space on ``GitHub`` or another online host (Bitbucket, Gitlab, etc). You can keep code files, text files, image files inside a repository as long as it does not excedes the 1GB quota.

**Version Control**: When working a Microsoft Word file, you either overwrite every saved file with a new save or you save multiple versions of the same file. With ``Git``, you don’t have to. It keeps *snapshots* of every point in time in the project’s history. There are IDEs for developing code that are compatible with ``Git``'s version control such as ``Matlab`` or ``Rstudio``. There are alternatives for Version Control but mainly for office documents (word files or spreadsheets) as in Google Docs or even for ``LaTeX`` projects that enable collaborative work in the cloud such as [ShareLaTeX](https://www.sharelatex.com/).

**Commit**: The basic ``Git`` command for version control. When creating a ``commit``, you are
taking a *snapshot* of your repository at that point in time. It creates a checkpoint to which you can reevaluate or restore your project.

**Branch**: How do multiple people work on a project at the same time without ``Git``
getting confused? Usually, they *branch off* of the main project with their
own version full of changes and updates. After a milestone is reached it is time to ``merge`` that branch back with the **master** of the main directory of the project. Other alternatives for multiple collaborators is to *fork* the main *repo* and create *pull requests* of the changes to be incorporated to the project.

## First commands

First we have to clone the repository to your local machine. This is done with the ``clone`` command of ``Git`` and the url of the *repo*.

```
user@localhost$ git clone https://github.com/agarbuno/hashcode-2015.git
```

Now you have a local copy of the *repo* in your machine. But first let's configure our git user in our machine

```
$ cd hashcode-2015
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@liv.ac.uk
```

This will set your user.name and user.email for **every** git project you clone in your local machine. Sometimes multiple accounts would be prefered and you can create only a *local* session without the ``--global`` flag of the command.

Now, every member of the team has a dedicated branch in the project (helps with the housekeeping). An alternative would be so that everyone forks the *repo* in their own account. But my experience has taught me this often gets convoluted and has a steep learning curve. So let's just KISS (keep it simple stu...).

Your first git command should be to *check the status* of the newly create repo, so by typing the ``status`` command we will receive something like:

```
$ git status
On branch master
Your branch is up-to-date with 'origin/master'.
nothing to commit, working directory clean
```

Which means that we haven't done anything. Now let's change to your own branch for developing with the ``checkout `` command with the branch flag `-b` and your first name. That is

```
$ git checkout -b <your name goes here>
```

You would notice that it references to a **new** branch. Now if you ask for the status you would see some changes from the previous status message. Now, we have to settle our branch with the global *repo*. To do this, let's try our first ``pull`` command from the repo:

```
$ git pull origin <your name>
```

This will bring to your computer the most updated version which is located on the project *repo* of your branch. Useful if you work in two computers (home and work, maybe...) Now let's  push your changes (at this time there shouldn't be any) to the *repo*

```
$ git push origin <your name>
```

This will upload the latest version *snapshot* of your branch back to the *master*. So what do when we have actual changes in our branch? Let's try this excercise.

1. Create a simple text file:  
        ```
        $ touch myfirstfile.txt
        ```
2. Add the file to the project's *repo*:  
        ```
        $ git add myfirstfile.txt
        ```
3. Create the *snapshot*:  
        ```
        $ git commit -a -m 'Here it goes nothing' <- Usually this is a meaningful message
        ```
4. ``Pull`` the *repo* and ``push`` your changes:  
        ``` 
        $ git pull origin <your name>  
        ```  
        ```
        $ git push origin <your name>
        ```
5. Confirm everything is in order :)  
        ```
        $ git status
        ```

Simple right?

```
$ git status
$ git add newfiles
$ git commit -a -m 'Meaningful message'
$ git pull origin <your name> 
$ git push origin <your name>
```
## Extras:

A very cool feature for *before* commiting changes is the ``diff`` command which highlights the differences between the last saved *snapshot* and your current working space.

## References:
http://readwrite.com/2013/09/30/understanding-github-a-journey-for-beginners-part-1
