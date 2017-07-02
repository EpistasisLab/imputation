





<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">

<meta content="origin-when-cross-origin" name="referrer" />

  <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/frameworks-d48d0c441ed0ab66aa7d582c5aaf762f4a1eef9a915871a36ddb07e71b01ffb2.css" integrity="sha256-1I0MRB7Qq2aqfVgsWq92L0oe75qRWHGjbdsH5xsB/7I=" media="all" rel="stylesheet" />
  <link crossorigin="anonymous" href="https://assets-cdn.github.com/assets/github-a6456108ae38d5ef012503fd17ca8d53dc8721f183c4cbff9418f8513ec0d238.css" integrity="sha256-pkVhCK441e8BJQP9F8qNU9yHIfGDxMv/lBj4UT7A0jg=" media="all" rel="stylesheet" />
  
  
  
  

  <meta name="viewport" content="width=device-width">
  
  <title>imputation/variationMiceMethodComp2.R at master · EpistasisLab/imputation</title>
  <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub">
  <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub">
  <meta property="fb:app_id" content="1401488693436528">

    
    <meta content="https://avatars0.githubusercontent.com/u/20861190?v=3&amp;s=400" property="og:image" /><meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="EpistasisLab/imputation" property="og:title" /><meta content="https://github.com/EpistasisLab/imputation" property="og:url" /><meta content="Contribute to imputation development by creating an account on GitHub." property="og:description" />

  <link rel="assets" href="https://assets-cdn.github.com/">
  <link rel="web-socket" href="wss://live.github.com/_sockets/VjI6MTc3OTM2MTY2OjM1ZDczYWUxZTZiNTI0YWY2NmM2Yjg3YTMyNTg3ZDc1NjE4YjRkNzRlYzI0MzQyNjY0Zjg3ZTVmNDk1ZWQ1YzI=--19eb41264e3ba9b256d550e0d1f268e35e475266">
  <meta name="pjax-timeout" content="1000">
  <link rel="sudo-modal" href="/sessions/sudo_modal">
  <meta name="request-id" content="E062:2F9D:A232D72:ECD5483:59332F1C" data-pjax-transient>
  

  <meta name="selected-link" value="repo_source" data-pjax-transient>

  <meta name="google-site-verification" content="KT5gs8h0wvaagLKAVWq8bbeNwnZZK1r1XQysX3xurLU">
<meta name="google-site-verification" content="ZzhVyEFwb7w3e0-uOTltm8Jsck2F5StVihD0exw2fsA">
    <meta name="google-analytics" content="UA-3769691-2">

<meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" /><meta content="https://collector.githubapp.com/github-external/browser_event" name="octolytics-event-url" /><meta content="E062:2F9D:A232D72:ECD5483:59332F1C" name="octolytics-dimension-request_id" /><meta content="iad" name="octolytics-dimension-region_edge" /><meta content="iad" name="octolytics-dimension-region_render" /><meta content="7855706" name="octolytics-actor-id" /><meta content="cbauer82" name="octolytics-actor-login" /><meta content="ca4186badc86af4db3e64ae9001eef4f732df8c1df2424b6d64d63f50a4cd4fb" name="octolytics-actor-hash" />
<meta content="/&lt;user-name&gt;/&lt;repo-name&gt;/blob/show" data-pjax-transient="true" name="analytics-location" />




  <meta class="js-ga-set" name="dimension1" content="Logged In">


  

      <meta name="hostname" content="github.com">
  <meta name="user-login" content="cbauer82">

      <meta name="expected-hostname" content="github.com">
    <meta name="js-proxy-site-detection-payload" content="NzY1OWY2MWYyMzlmNGZiN2VjMzU0ZmJlMzhiZWJhZjljNDkzNDY4MzI2ZTdhZDIxMjg3YTEwOTc1ZjJmN2FkM3x7InJlbW90ZV9hZGRyZXNzIjoiNjkuMTQwLjE5OS4yMzkiLCJyZXF1ZXN0X2lkIjoiRTA2MjoyRjlEOkEyMzJENzI6RUNENTQ4Mzo1OTMzMkYxQyIsInRpbWVzdGFtcCI6MTQ5NjUyNjYyNSwiaG9zdCI6ImdpdGh1Yi5jb20ifQ==">


  <meta name="html-safe-nonce" content="85036e6fbbe4aeacff78c680770b5911475e70fd">

  <meta http-equiv="x-pjax-version" content="f2a391d84c9a9c3816af1e59762eebc9">
  

    
  <meta name="description" content="Contribute to imputation development by creating an account on GitHub.">
  <meta name="go-import" content="github.com/EpistasisLab/imputation git https://github.com/EpistasisLab/imputation.git">

  <meta content="20861190" name="octolytics-dimension-user_id" /><meta content="EpistasisLab" name="octolytics-dimension-user_login" /><meta content="68543154" name="octolytics-dimension-repository_id" /><meta content="EpistasisLab/imputation" name="octolytics-dimension-repository_nwo" /><meta content="false" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="68543154" name="octolytics-dimension-repository_network_root_id" /><meta content="EpistasisLab/imputation" name="octolytics-dimension-repository_network_root_nwo" /><meta content="false" name="octolytics-dimension-repository_explore_github_marketplace_ci_cta_shown" />
  <link href="https://github.com/EpistasisLab/imputation/commits/master.atom?token=AHfeWpdUtzR6kINyU4BuQB6JRUgkAVBtks63Px4xwA%3D%3D" rel="alternate" title="Recent Commits to imputation:master" type="application/atom+xml">


    <link rel="canonical" href="https://github.com/EpistasisLab/imputation/blob/master/variationMiceMethodComp2.R" data-pjax-transient>


  <meta name="browser-stats-url" content="https://api.github.com/_private/browser/stats">

  <meta name="browser-errors-url" content="https://api.github.com/_private/browser/errors">

  <link rel="mask-icon" href="https://assets-cdn.github.com/pinned-octocat.svg" color="#000000">
  <link rel="icon" type="image/x-icon" href="https://assets-cdn.github.com/favicon.ico">

<meta name="theme-color" content="#1e2327">


  <meta name="u2f-support" content="true">

  </head>

  <body class="logged-in env-production emoji-size-boost page-blob">
    



  <div class="position-relative js-header-wrapper ">
    <a href="#start-of-content" tabindex="1" class="accessibility-aid js-skip-to-content">Skip to content</a>
    <div id="js-pjax-loader-bar" class="pjax-loader-bar"><div class="progress"></div></div>

    
    
    



        
<div class="header" role="banner">
  <div class="container clearfix">
    <a class="header-logo-invertocat" href="https://github.com/" data-hotkey="g d" aria-label="Homepage" data-ga-click="Header, go to dashboard, icon:logo">
  <svg aria-hidden="true" class="octicon octicon-mark-github" height="32" version="1.1" viewBox="0 0 16 16" width="32"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>


        <div class="header-search scoped-search site-scoped-search js-site-search" role="search">
  <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/EpistasisLab/imputation/search" class="js-site-search-form" data-scoped-search-url="/EpistasisLab/imputation/search" data-unscoped-search-url="/search" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <label class="form-control header-search-wrapper js-chromeless-input-container">
        <a href="/EpistasisLab/imputation/blob/master/variationMiceMethodComp2.R" class="header-search-scope no-underline">This repository</a>
      <input type="text"
        class="form-control header-search-input js-site-search-focus js-site-search-field is-clearable"
        data-hotkey="s"
        name="q"
        value=""
        placeholder="Search"
        aria-label="Search this repository"
        data-unscoped-placeholder="Search GitHub"
        data-scoped-placeholder="Search"
        autocapitalize="off">
        <input type="hidden" class="js-site-search-type-field" name="type" >
    </label>
</form></div>


      <ul class="header-nav float-left" role="navigation">
        <li class="header-nav-item">
          <a href="/pulls" aria-label="Pull requests you created" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:pulls context:user" data-hotkey="g p" data-selected-links="/pulls /pulls/assigned /pulls/mentioned /pulls">
            Pull requests
</a>        </li>
        <li class="header-nav-item">
          <a href="/issues" aria-label="Issues you created" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:issues context:user" data-hotkey="g i" data-selected-links="/issues /issues/assigned /issues/mentioned /issues">
            Issues
</a>        </li>
            <li class="header-nav-item">
              <a href="/marketplace" class="js-selected-navigation-item header-nav-link" data-ga-click="Header, click, Nav menu - item:marketplace context:user" data-selected-links=" /marketplace">
                Marketplace
</a>            </li>
          <li class="header-nav-item">
            <a class="header-nav-link" href="https://gist.github.com/" data-ga-click="Header, go to gist, text:gist">Gist</a>
          </li>
      </ul>

    
<ul class="header-nav user-nav float-right" id="user-links">
  <li class="header-nav-item">
    
    <a href="/notifications" aria-label="You have no unread notifications" class="header-nav-link notification-indicator tooltipped tooltipped-s js-socket-channel js-notification-indicator " data-channel="notification-changed:7855706" data-ga-click="Header, go to notifications, icon:read" data-hotkey="g n">
        <span class="mail-status "></span>
        <svg aria-hidden="true" class="octicon octicon-bell float-left" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 12v1H0v-1l.73-.58c.77-.77.81-2.55 1.19-4.42C2.69 3.23 6 2 6 2c0-.55.45-1 1-1s1 .45 1 1c0 0 3.39 1.23 4.16 5 .38 1.88.42 3.66 1.19 4.42l.66.58H14zm-7 4c1.11 0 2-.89 2-2H5c0 1.11.89 2 2 2z"/></svg>
</a>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link tooltipped tooltipped-s js-menu-target" href="/new"
       aria-label="Create new…"
       data-ga-click="Header, create new, icon:add">
      <svg aria-hidden="true" class="octicon octicon-plus float-left" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 9H7v5H5V9H0V7h5V2h2v5h5z"/></svg>
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <ul class="dropdown-menu dropdown-menu-sw">
        
<a class="dropdown-item" href="/new" data-ga-click="Header, create new repository">
  New repository
</a>

  <a class="dropdown-item" href="/new/import" data-ga-click="Header, import a repository">
    Import repository
  </a>

<a class="dropdown-item" href="https://gist.github.com/" data-ga-click="Header, create new gist">
  New gist
</a>

  <a class="dropdown-item" href="/organizations/new" data-ga-click="Header, create new organization">
    New organization
  </a>



  <div class="dropdown-divider"></div>
  <div class="dropdown-header">
    <span title="EpistasisLab/imputation">This repository</span>
  </div>
    <a class="dropdown-item" href="/EpistasisLab/imputation/issues/new" data-ga-click="Header, create new issue">
      New issue
    </a>

      </ul>
    </div>
  </li>

  <li class="header-nav-item dropdown js-menu-container">
    <a class="header-nav-link name tooltipped tooltipped-sw js-menu-target" href="/cbauer82"
       aria-label="View profile and more"
       data-ga-click="Header, show menu, icon:avatar">
      <img alt="@cbauer82" class="avatar" src="https://avatars3.githubusercontent.com/u/7855706?v=3&amp;s=40" height="20" width="20">
      <span class="dropdown-caret"></span>
    </a>

    <div class="dropdown-menu-content js-menu-content">
      <div class="dropdown-menu dropdown-menu-sw">
        <div class="dropdown-header header-nav-current-user css-truncate">
          Signed in as <strong class="css-truncate-target">cbauer82</strong>
        </div>

        <div class="dropdown-divider"></div>

        <a class="dropdown-item" href="/cbauer82" data-ga-click="Header, go to profile, text:your profile">
          Your profile
        </a>
        <a class="dropdown-item" href="/cbauer82?tab=stars" data-ga-click="Header, go to starred repos, text:your stars">
          Your stars
        </a>
        <a class="dropdown-item" href="/explore" data-ga-click="Header, go to explore, text:explore">
          Explore
        </a>
        <a class="dropdown-item" href="https://help.github.com" data-ga-click="Header, go to help, text:help">
          Help
        </a>

        <div class="dropdown-divider"></div>

        <a class="dropdown-item" href="/settings/profile" data-ga-click="Header, go to settings, icon:settings">
          Settings
        </a>

        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/logout" class="logout-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="Ul2COt6HHFw7Vc+NnKUlcyCF/r49BFQzsQeRngalQJ6YkPJfwVGF0KyhWr2BLM6CtW+8hYOFe9jZeH0LU5ki1g==" /></div>
          <button type="submit" class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
            Sign out
          </button>
</form>      </div>
    </div>
  </li>
</ul>


    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/logout" class="sr-only right-0" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="5hqLmOXEa//zYYY3PgaWxBXsXgndkmNLqTzDAYSBnbIs1/v9+hLyc2SVEwcjj301gAYcMmMTTKDBQy+U0b3/+g==" /></div>
      <button type="submit" class="dropdown-item dropdown-signout" data-ga-click="Header, sign out, icon:logout">
        Sign out
      </button>
</form>  </div>
</div>


      

  </div>

  <div id="start-of-content" class="accessibility-aid"></div>

    <div id="js-flash-container">
</div>



  <div role="main">
        <div itemscope itemtype="http://schema.org/SoftwareSourceCode">
    <div id="js-repo-pjax-container" data-pjax-container>
        




    <div class="pagehead repohead instapaper_ignore readability-menu experiment-repo-nav">
      <div class="container repohead-details-container">

        <ul class="pagehead-actions">
  <li>
        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/notifications/subscribe" class="js-social-container" data-autosubmit="true" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="RUldM1z3J7pnZg+bMEwhD0WcexcKFyzbO8u0e77lfCXOPIItXAc3fbyICeBgVY1WHhyfZ8SnApwTRaqFPDezbQ==" /></div>      <input class="form-control" id="repository_id" name="repository_id" type="hidden" value="68543154" />

        <div class="select-menu js-menu-container js-select-menu">
          <a href="/EpistasisLab/imputation/subscription"
            class="btn btn-sm btn-with-count select-menu-button js-menu-target" role="button" tabindex="0" aria-haspopup="true"
            data-ga-click="Repository, click Watch settings, action:blob#show">
            <span class="js-select-button">
                <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                Unwatch
            </span>
          </a>
            <a class="social-count js-social-count"
              href="/EpistasisLab/imputation/watchers"
              aria-label="3 users are watching this repository">
              3
            </a>

        <div class="select-menu-modal-holder">
          <div class="select-menu-modal subscription-menu-modal js-menu-content">
            <div class="select-menu-header js-navigation-enable" tabindex="-1">
              <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
              <span class="select-menu-title">Notifications</span>
            </div>

              <div class="select-menu-list js-navigation-container" role="menu">

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input id="do_included" name="do" type="radio" value="included" />
                    <span class="select-menu-item-heading">Not watching</span>
                    <span class="description">Be notified when participating or @mentioned.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                      Watch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item selected" role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input checked="checked" id="do_subscribed" name="do" type="radio" value="subscribed" />
                    <span class="select-menu-item-heading">Watching</span>
                    <span class="description">Be notified of all conversations.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-eye" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.06 2C3 2 0 8 0 8s3 6 8.06 6C13 14 16 8 16 8s-3-6-7.94-6zM8 12c-2.2 0-4-1.78-4-4 0-2.2 1.8-4 4-4 2.22 0 4 1.8 4 4 0 2.22-1.78 4-4 4zm2-4c0 1.11-.89 2-2 2-1.11 0-2-.89-2-2 0-1.11.89-2 2-2 1.11 0 2 .89 2 2z"/></svg>
                        Unwatch
                    </span>
                  </div>
                </div>

                <div class="select-menu-item js-navigation-item " role="menuitem" tabindex="0">
                  <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
                  <div class="select-menu-item-text">
                    <input id="do_ignore" name="do" type="radio" value="ignore" />
                    <span class="select-menu-item-heading">Ignoring</span>
                    <span class="description">Never be notified.</span>
                    <span class="js-select-button-text hidden-select-button-text">
                      <svg aria-hidden="true" class="octicon octicon-mute" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8 2.81v10.38c0 .67-.81 1-1.28.53L3 10H1c-.55 0-1-.45-1-1V7c0-.55.45-1 1-1h2l3.72-3.72C7.19 1.81 8 2.14 8 2.81zm7.53 3.22l-1.06-1.06-1.97 1.97-1.97-1.97-1.06 1.06L11.44 8 9.47 9.97l1.06 1.06 1.97-1.97 1.97 1.97 1.06-1.06L13.56 8l1.97-1.97z"/></svg>
                        Stop ignoring
                    </span>
                  </div>
                </div>

              </div>

            </div>
          </div>
        </div>
</form>
  </li>

  <li>
      <div class="js-toggler-container js-social-container starring-container ">
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/EpistasisLab/imputation/unstar" class="starred" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="l6bSosSpeJS1oIGpVvTiUzpmZaW2WnPCwuTMypo3HZKTntCPtLoFZX/zVnqJdZMhOZ19nzB/YMUBPxOIakkePg==" /></div>
      <button
        type="submit"
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Unstar this repository" title="Unstar EpistasisLab/imputation"
        data-ga-click="Repository, click unstar button, action:blob#show; text:Unstar">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74z"/></svg>
        Unstar
      </button>
        <a class="social-count js-social-count" href="/EpistasisLab/imputation/stargazers"
           aria-label="0 users starred this repository">
          0
        </a>
</form>
    <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/EpistasisLab/imputation/star" class="unstarred" data-remote="true" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="XEtJKm0kuz7K8Jg0EGmsDhq/Itendgvdi6jKOWIzRzIO3tApPg2Y4FwQVr7UIyUUuC//dTF8l9fSALdyaE7raw==" /></div>
      <button
        type="submit"
        class="btn btn-sm btn-with-count js-toggler-target"
        aria-label="Star this repository" title="Star EpistasisLab/imputation"
        data-ga-click="Repository, click star button, action:blob#show; text:Star">
        <svg aria-hidden="true" class="octicon octicon-star" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M14 6l-4.9-.64L7 1 4.9 5.36 0 6l3.6 3.26L2.67 14 7 11.67 11.33 14l-.93-4.74z"/></svg>
        Star
      </button>
        <a class="social-count js-social-count" href="/EpistasisLab/imputation/stargazers"
           aria-label="0 users starred this repository">
          0
        </a>
</form>  </div>

  </li>

  <li>
          <a href="#fork-destination-box" class="btn btn-sm btn-with-count"
              title="Fork your own copy of EpistasisLab/imputation to your account"
              aria-label="Fork your own copy of EpistasisLab/imputation to your account"
              rel="facebox"
              data-ga-click="Repository, show fork modal, action:blob#show; text:Fork">
              <svg aria-hidden="true" class="octicon octicon-repo-forked" height="16" version="1.1" viewBox="0 0 10 16" width="10"><path fill-rule="evenodd" d="M8 1a1.993 1.993 0 0 0-1 3.72V6L5 8 3 6V4.72A1.993 1.993 0 0 0 2 1a1.993 1.993 0 0 0-1 3.72V6.5l3 3v1.78A1.993 1.993 0 0 0 5 15a1.993 1.993 0 0 0 1-3.72V9.5l3-3V4.72A1.993 1.993 0 0 0 8 1zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3 10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm3-10c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            Fork
          </a>

          <div id="fork-destination-box" style="display: none;">
            <h2 class="facebox-header" data-facebox-id="facebox-header">Where should we fork this repository?</h2>
            <include-fragment src=""
                class="js-fork-select-fragment fork-select-fragment"
                data-url="/EpistasisLab/imputation/fork?fragment=1">
              <img alt="Loading" height="64" src="https://assets-cdn.github.com/images/spinners/octocat-spinner-128.gif" width="64" />
            </include-fragment>
          </div>

    <a href="/EpistasisLab/imputation/network" class="social-count"
       aria-label="0 users forked this repository">
      0
    </a>
  </li>
</ul>

        <h1 class="private ">
  <svg aria-hidden="true" class="octicon octicon-lock" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M4 13H3v-1h1v1zm8-6v7c0 .55-.45 1-1 1H1c-.55 0-1-.45-1-1V7c0-.55.45-1 1-1h1V4c0-2.2 1.8-4 4-4s4 1.8 4 4v2h1c.55 0 1 .45 1 1zM3.8 6h4.41V4c0-1.22-.98-2.2-2.2-2.2-1.22 0-2.2.98-2.2 2.2v2H3.8zM11 7H2v7h9V7zM4 8H3v1h1V8zm0 2H3v1h1v-1z"/></svg>
  <span class="author" itemprop="author"><a href="/EpistasisLab" class="url fn" rel="author">EpistasisLab</a></span><!--
--><span class="path-divider">/</span><!--
--><strong itemprop="name"><a href="/EpistasisLab/imputation" data-pjax="#js-repo-pjax-container">imputation</a></strong>
    <span class="Label Label--outline v-align-middle">Private</span>

</h1>

      </div>
      <div class="container">
        
<nav class="reponav js-repo-nav js-sidenav-container-pjax"
     itemscope
     itemtype="http://schema.org/BreadcrumbList"
     role="navigation"
     data-pjax="#js-repo-pjax-container">

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/EpistasisLab/imputation" class="js-selected-navigation-item selected reponav-item" data-hotkey="g c" data-selected-links="repo_source repo_downloads repo_commits repo_releases repo_tags repo_branches /EpistasisLab/imputation" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-code" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M9.5 3L8 4.5 11.5 8 8 11.5 9.5 13 14 8 9.5 3zm-5 0L0 8l4.5 5L6 11.5 2.5 8 6 4.5 4.5 3z"/></svg>
      <span itemprop="name">Code</span>
      <meta itemprop="position" content="1">
</a>  </span>

    <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
      <a href="/EpistasisLab/imputation/issues" class="js-selected-navigation-item reponav-item" data-hotkey="g i" data-selected-links="repo_issues repo_labels repo_milestones /EpistasisLab/imputation/issues" itemprop="url">
        <svg aria-hidden="true" class="octicon octicon-issue-opened" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M7 2.3c3.14 0 5.7 2.56 5.7 5.7s-2.56 5.7-5.7 5.7A5.71 5.71 0 0 1 1.3 8c0-3.14 2.56-5.7 5.7-5.7zM7 1C3.14 1 0 4.14 0 8s3.14 7 7 7 7-3.14 7-7-3.14-7-7-7zm1 3H6v5h2V4zm0 6H6v2h2v-2z"/></svg>
        <span itemprop="name">Issues</span>
        <span class="Counter">0</span>
        <meta itemprop="position" content="2">
</a>    </span>

  <span itemscope itemtype="http://schema.org/ListItem" itemprop="itemListElement">
    <a href="/EpistasisLab/imputation/pulls" class="js-selected-navigation-item reponav-item" data-hotkey="g p" data-selected-links="repo_pulls /EpistasisLab/imputation/pulls" itemprop="url">
      <svg aria-hidden="true" class="octicon octicon-git-pull-request" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M11 11.28V5c-.03-.78-.34-1.47-.94-2.06C9.46 2.35 8.78 2.03 8 2H7V0L4 3l3 3V4h1c.27.02.48.11.69.31.21.2.3.42.31.69v6.28A1.993 1.993 0 0 0 10 15a1.993 1.993 0 0 0 1-3.72zm-1 2.92c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zM4 3c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v6.56A1.993 1.993 0 0 0 2 15a1.993 1.993 0 0 0 1-3.72V4.72c.59-.34 1-.98 1-1.72zm-.8 10c0 .66-.55 1.2-1.2 1.2-.65 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2zM2 4.2C1.34 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
      <span itemprop="name">Pull requests</span>
      <span class="Counter">0</span>
      <meta itemprop="position" content="3">
</a>  </span>

    <a href="/EpistasisLab/imputation/projects" class="js-selected-navigation-item reponav-item" data-selected-links="repo_projects new_repo_project repo_project /EpistasisLab/imputation/projects">
      <svg aria-hidden="true" class="octicon octicon-project" height="16" version="1.1" viewBox="0 0 15 16" width="15"><path fill-rule="evenodd" d="M10 12h3V2h-3v10zm-4-2h3V2H6v8zm-4 4h3V2H2v12zm-1 1h13V1H1v14zM14 0H1a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h13a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1z"/></svg>
      Projects
      <span class="Counter" >0</span>
</a>
    <a href="/EpistasisLab/imputation/wiki" class="js-selected-navigation-item reponav-item" data-hotkey="g w" data-selected-links="repo_wiki /EpistasisLab/imputation/wiki">
      <svg aria-hidden="true" class="octicon octicon-book" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M3 5h4v1H3V5zm0 3h4V7H3v1zm0 2h4V9H3v1zm11-5h-4v1h4V5zm0 2h-4v1h4V7zm0 2h-4v1h4V9zm2-6v9c0 .55-.45 1-1 1H9.5l-1 1-1-1H2c-.55 0-1-.45-1-1V3c0-.55.45-1 1-1h5.5l1 1 1-1H15c.55 0 1 .45 1 1zm-8 .5L7.5 3H2v9h6V3.5zm7-.5H9.5l-.5.5V12h6V3z"/></svg>
      Wiki
</a>

    <div class="reponav-dropdown js-menu-container">
      <button type="button" class="btn-link reponav-item reponav-dropdown js-menu-target " data-no-toggle aria-expanded="false" aria-haspopup="true">
        Insights
        <svg aria-hidden="true" class="octicon octicon-triangle-down v-align-middle text-gray" height="11" version="1.1" viewBox="0 0 12 16" width="8"><path fill-rule="evenodd" d="M0 5l6 6 6-6z"/></svg>
      </button>
      <div class="dropdown-menu-content js-menu-content">
        <div class="dropdown-menu dropdown-menu-sw">
          <a class="dropdown-item" href="/EpistasisLab/imputation/pulse" data-skip-pjax>
            <svg aria-hidden="true" class="octicon octicon-pulse" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M11.5 8L8.8 5.4 6.6 8.5 5.5 1.6 2.38 8H0v2h3.6l.9-1.8.9 5.4L9 8.5l1.6 1.5H14V8z"/></svg>
            Pulse
          </a>
          <a class="dropdown-item" href="/EpistasisLab/imputation/graphs" data-skip-pjax>
            <svg aria-hidden="true" class="octicon octicon-graph" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M16 14v1H0V0h1v14h15zM5 13H3V8h2v5zm4 0H7V3h2v10zm4 0h-2V6h2v7z"/></svg>
            Graphs
          </a>
        </div>
      </div>
    </div>
</nav>

      </div>
    </div>

<div class="container new-discussion-timeline experiment-repo-nav">
  <div class="repository-content">

    
          

<a href="/EpistasisLab/imputation/blob/27a9d18ac602e6b643e3258c7cb7bf1e35ecaffc/variationMiceMethodComp2.R" class="d-none js-permalink-shortcut" data-hotkey="y">Permalink</a>

<!-- blob contrib key: blob_contributors:v21:4d1647494f5921737fddeac7a9b54443 -->

<div class="file-navigation js-zeroclipboard-container">
  
<div class="select-menu branch-select-menu js-menu-container js-select-menu float-left">
  <button class=" btn btn-sm select-menu-button js-menu-target css-truncate" data-hotkey="w"
    
    type="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
      <i>Branch:</i>
      <span class="js-select-button css-truncate-target">master</span>
  </button>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax>

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <svg aria-label="Close" class="octicon octicon-x js-menu-close" height="16" role="img" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
        <span class="select-menu-title">Switch branches/tags</span>
      </div>

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Find or create a branch…" id="context-commitish-filter-field" class="form-control js-filterable-field js-navigation-enable" placeholder="Find or create a branch…">
        </div>
        <div class="select-menu-tabs">
          <ul>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="branches" data-filter-placeholder="Find or create a branch…" class="js-select-menu-tab" role="tab">Branches</a>
            </li>
            <li class="select-menu-tab">
              <a href="#" data-tab-filter="tags" data-filter-placeholder="Find a tag…" class="js-select-menu-tab" role="tab">Tags</a>
            </li>
          </ul>
        </div>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches" role="menu">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/EpistasisLab/imputation/blob/develop/variationMiceMethodComp2.R"
               data-name="develop"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                develop
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open selected"
               href="/EpistasisLab/imputation/blob/master/variationMiceMethodComp2.R"
               data-name="master"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                master
              </span>
            </a>
            <a class="select-menu-item js-navigation-item js-navigation-open "
               href="/EpistasisLab/imputation/blob/r_save_all/variationMiceMethodComp2.R"
               data-name="r_save_all"
               data-skip-pjax="true"
               rel="nofollow">
              <svg aria-hidden="true" class="octicon octicon-check select-menu-item-icon" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M12 5l-8 8-4-4 1.5-1.5L4 10l6.5-6.5z"/></svg>
              <span class="select-menu-item-text css-truncate-target js-select-menu-filter-text">
                r_save_all
              </span>
            </a>
        </div>

          <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/EpistasisLab/imputation/branches" class="js-create-branch select-menu-item select-menu-new-item-form js-navigation-item js-new-item-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="qEExixqN9HOM7NJcmdMZpI0pGg6L4rL0hTk0ZkctC2WEeJS2v5WVlE4kF7s67FzDP+WOipaItTiNzbMTP8R6Fw==" /></div>
          <svg aria-hidden="true" class="octicon octicon-git-branch select-menu-item-icon" height="16" version="1.1" viewBox="0 0 10 16" width="10"><path fill-rule="evenodd" d="M10 5c0-1.11-.89-2-2-2a1.993 1.993 0 0 0-1 3.72v.3c-.02.52-.23.98-.63 1.38-.4.4-.86.61-1.38.63-.83.02-1.48.16-2 .45V4.72a1.993 1.993 0 0 0-1-3.72C.88 1 0 1.89 0 3a2 2 0 0 0 1 1.72v6.56c-.59.35-1 .99-1 1.72 0 1.11.89 2 2 2 1.11 0 2-.89 2-2 0-.53-.2-1-.53-1.36.09-.06.48-.41.59-.47.25-.11.56-.17.94-.17 1.05-.05 1.95-.45 2.75-1.25S8.95 7.77 9 6.73h-.02C9.59 6.37 10 5.73 10 5zM2 1.8c.66 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2C1.35 4.2.8 3.65.8 3c0-.65.55-1.2 1.2-1.2zm0 12.41c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2zm6-8c-.66 0-1.2-.55-1.2-1.2 0-.65.55-1.2 1.2-1.2.65 0 1.2.55 1.2 1.2 0 .65-.55 1.2-1.2 1.2z"/></svg>
            <div class="select-menu-item-text">
              <span class="select-menu-item-heading">Create branch: <span class="js-new-item-name"></span></span>
              <span class="description">from ‘master’</span>
            </div>
            <input type="hidden" name="name" id="name" class="js-new-item-value">
            <input type="hidden" name="branch" id="branch" value="master">
            <input type="hidden" name="path" id="path" value="variationMiceMethodComp2.R">
</form>
      </div>

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div>

    </div>
  </div>
</div>

  <div class="BtnGroup float-right">
    <a href="/EpistasisLab/imputation/find/master"
          class="js-pjax-capture-input btn btn-sm BtnGroup-item"
          data-pjax
          data-hotkey="t">
      Find file
    </a>
    <button aria-label="Copy file path to clipboard" class="js-zeroclipboard btn btn-sm BtnGroup-item tooltipped tooltipped-s" data-copied-hint="Copied!" type="button">Copy path</button>
  </div>
  <div class="breadcrumb js-zeroclipboard-target">
    <span class="repo-root js-repo-root"><span class="js-path-segment"><a href="/EpistasisLab/imputation"><span>imputation</span></a></span></span><span class="separator">/</span><strong class="final-path">variationMiceMethodComp2.R</strong>
  </div>
</div>



  <div class="commit-tease">
      <span class="float-right">
        <a class="commit-tease-sha" href="/EpistasisLab/imputation/commit/27a9d18ac602e6b643e3258c7cb7bf1e35ecaffc" data-pjax>
          27a9d18
        </a>
        <relative-time datetime="2017-06-03T19:50:03Z">Jun 3, 2017</relative-time>
      </span>
      <div>
        <img alt="@cbauer82" class="avatar" height="20" src="https://avatars3.githubusercontent.com/u/7855706?v=3&amp;s=40" width="20" />
        <a href="/cbauer82" class="user-mention" rel="contributor">cbauer82</a>
          <a href="/EpistasisLab/imputation/commit/27a9d18ac602e6b643e3258c7cb7bf1e35ecaffc" class="message" data-pjax="true" title="Add files via upload">Add files via upload</a>
      </div>

    <div class="commit-tease-contributors">
      <button type="button" class="btn-link muted-link contributors-toggle" data-facebox="#blob_contributors_box">
        <strong>1</strong>
         contributor
      </button>
      
    </div>

    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header" data-facebox-id="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list" data-facebox-id="facebox-description">
          <li class="facebox-user-list-item">
            <img alt="@cbauer82" height="24" src="https://avatars1.githubusercontent.com/u/7855706?v=3&amp;s=48" width="24" />
            <a href="/cbauer82">cbauer82</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file">
  <div class="file-header">
  <div class="file-actions">

    <div class="BtnGroup">
      <a href="/EpistasisLab/imputation/raw/master/variationMiceMethodComp2.R" class="btn btn-sm BtnGroup-item" id="raw-url">Raw</a>
        <a href="/EpistasisLab/imputation/blame/master/variationMiceMethodComp2.R" class="btn btn-sm js-update-url-with-hash BtnGroup-item" data-hotkey="b">Blame</a>
      <a href="/EpistasisLab/imputation/commits/master/variationMiceMethodComp2.R" class="btn btn-sm BtnGroup-item" rel="nofollow">History</a>
    </div>

        <a class="btn-octicon tooltipped tooltipped-nw"
           href="https://desktop.github.com"
           aria-label="Open this file in GitHub Desktop"
           data-ga-click="Repository, open with desktop, type:mac">
            <svg aria-hidden="true" class="octicon octicon-device-desktop" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M15 2H1c-.55 0-1 .45-1 1v9c0 .55.45 1 1 1h5.34c-.25.61-.86 1.39-2.34 2h8c-1.48-.61-2.09-1.39-2.34-2H15c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm0 9H1V3h14v8z"/></svg>
        </a>

        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/EpistasisLab/imputation/edit/master/variationMiceMethodComp2.R" class="inline-form js-update-url-with-hash" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="ZwacmRVQnfZj0JjTiTIJRMQgDtbokFUOfn8hm5Vm7wtMGyi7rQLk9hB7lWGpUPy+vQMdxgDEJhUv/BDr46VhwA==" /></div>
          <button class="btn-octicon tooltipped tooltipped-nw" type="submit"
            aria-label="Edit this file" data-hotkey="e" data-disable-with>
            <svg aria-hidden="true" class="octicon octicon-pencil" height="16" version="1.1" viewBox="0 0 14 16" width="14"><path fill-rule="evenodd" d="M0 12v3h3l8-8-3-3-8 8zm3 2H1v-2h1v1h1v1zm10.3-9.3L12 6 9 3l1.3-1.3a.996.996 0 0 1 1.41 0l1.59 1.59c.39.39.39 1.02 0 1.41z"/></svg>
          </button>
</form>        <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="/EpistasisLab/imputation/delete/master/variationMiceMethodComp2.R" class="inline-form" method="post"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /><input name="authenticity_token" type="hidden" value="bNPoge0JmhktWjxTGRXOIbadmA9XzIwMR+R+tqreTg59gNQiQCuWsKbfGcq1dAaq4YRFXwIsvREtaB0xDCVYyw==" /></div>
          <button class="btn-octicon btn-octicon-danger tooltipped tooltipped-nw" type="submit"
            aria-label="Delete this file" data-disable-with>
            <svg aria-hidden="true" class="octicon octicon-trashcan" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M11 2H9c0-.55-.45-1-1-1H5c-.55 0-1 .45-1 1H2c-.55 0-1 .45-1 1v1c0 .55.45 1 1 1v9c0 .55.45 1 1 1h7c.55 0 1-.45 1-1V5c.55 0 1-.45 1-1V3c0-.55-.45-1-1-1zm-1 12H3V5h1v8h1V5h1v8h1V5h1v8h1V5h1v9zm1-10H2V3h9v1z"/></svg>
          </button>
</form>  </div>

  <div class="file-info">
      209 lines (162 sloc)
      <span class="file-info-divider"></span>
    7.36 KB
  </div>
</div>

  

  <div itemprop="text" class="blob-wrapper data type-r">
      <table class="highlight tab-size js-file-line-container" data-tab-size="8">
      <tr>
        <td id="L1" class="blob-num js-line-number" data-line-number="1"></td>
        <td id="LC1" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">#</span>## Look at the variation between different imputations for different methods in the mice package</span></td>
      </tr>
      <tr>
        <td id="L2" class="blob-num js-line-number" data-line-number="2"></td>
        <td id="LC2" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L3" class="blob-num js-line-number" data-line-number="3"></td>
        <td id="LC3" class="blob-code blob-code-inner js-file-line">library(<span class="pl-smi">ggplot2</span>)</td>
      </tr>
      <tr>
        <td id="L4" class="blob-num js-line-number" data-line-number="4"></td>
        <td id="LC4" class="blob-code blob-code-inner js-file-line">library(<span class="pl-smi">reshape2</span>)</td>
      </tr>
      <tr>
        <td id="L5" class="blob-num js-line-number" data-line-number="5"></td>
        <td id="LC5" class="blob-code blob-code-inner js-file-line">library(<span class="pl-smi">dplyr</span>)</td>
      </tr>
      <tr>
        <td id="L6" class="blob-num js-line-number" data-line-number="6"></td>
        <td id="LC6" class="blob-code blob-code-inner js-file-line">library(<span class="pl-smi">magrittr</span>)</td>
      </tr>
      <tr>
        <td id="L7" class="blob-num js-line-number" data-line-number="7"></td>
        <td id="LC7" class="blob-code blob-code-inner js-file-line">load(<span class="pl-s"><span class="pl-pds">&quot;</span>~/data/imputation/miceImpList6zeroColumns.Rdata<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L8" class="blob-num js-line-number" data-line-number="8"></td>
        <td id="LC8" class="blob-code blob-code-inner js-file-line">load(<span class="pl-s"><span class="pl-pds">&quot;</span>~/data/imputation/evaluationDatasetBoxCox20161108.Rfile<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L9" class="blob-num js-line-number" data-line-number="9"></td>
        <td id="LC9" class="blob-code blob-code-inner js-file-line">load(<span class="pl-s"><span class="pl-pds">&quot;</span>~/data/imputation/evaluationSpikeInBoxCox20161108.Rfile<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L10" class="blob-num js-line-number" data-line-number="10"></td>
        <td id="LC10" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L11" class="blob-num js-line-number" data-line-number="11"></td>
        <td id="LC11" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L12" class="blob-num js-line-number" data-line-number="12"></td>
        <td id="LC12" class="blob-code blob-code-inner js-file-line">set.seed(<span class="pl-c1">23515</span>)</td>
      </tr>
      <tr>
        <td id="L13" class="blob-num js-line-number" data-line-number="13"></td>
        <td id="LC13" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">rows</span><span class="pl-k">&lt;-</span>sample(<span class="pl-c1">1</span><span class="pl-k">:</span>nrow(<span class="pl-smi">spikeInSetBoxCox</span>), <span class="pl-c1">10000</span>)</td>
      </tr>
      <tr>
        <td id="L14" class="blob-num js-line-number" data-line-number="14"></td>
        <td id="LC14" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">smallEval</span><span class="pl-k">&lt;-</span><span class="pl-smi">evalSetBoxCox</span>[<span class="pl-smi">rows</span>,]</td>
      </tr>
      <tr>
        <td id="L15" class="blob-num js-line-number" data-line-number="15"></td>
        <td id="LC15" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">smallSpikeIn</span><span class="pl-k">&lt;-</span><span class="pl-smi">spikeInSetBoxCox</span>[<span class="pl-smi">rows</span>,]</td>
      </tr>
      <tr>
        <td id="L16" class="blob-num js-line-number" data-line-number="16"></td>
        <td id="LC16" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L17" class="blob-num js-line-number" data-line-number="17"></td>
        <td id="LC17" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">#</span> variabilityTable&lt;-data.frame(matrix( nrow = 0, ncol = 6))</span></td>
      </tr>
      <tr>
        <td id="L18" class="blob-num js-line-number" data-line-number="18"></td>
        <td id="LC18" class="blob-code blob-code-inner js-file-line"><span class="pl-c"><span class="pl-c">#</span> colnames(variabilityTable)&lt;-c(&quot;method&quot;,&quot;variable&quot;,&quot;m.iter&quot;,&quot;RMSEobs&quot;,&quot;RMSEimp&quot;)</span></td>
      </tr>
      <tr>
        <td id="L19" class="blob-num js-line-number" data-line-number="19"></td>
        <td id="LC19" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L20" class="blob-num js-line-number" data-line-number="20"></td>
        <td id="LC20" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">variabilityTable</span><span class="pl-k">&lt;-</span><span class="pl-k">data.frame</span>(<span class="pl-k">matrix</span>( <span class="pl-v">nrow</span> <span class="pl-k">=</span> <span class="pl-c1">0</span>, <span class="pl-v">ncol</span> <span class="pl-k">=</span> <span class="pl-c1">6</span>))</td>
      </tr>
      <tr>
        <td id="L21" class="blob-num js-line-number" data-line-number="21"></td>
        <td id="LC21" class="blob-code blob-code-inner js-file-line">colnames(<span class="pl-smi">variabilityTable</span>)<span class="pl-k">&lt;-</span>c(<span class="pl-s"><span class="pl-pds">&quot;</span>method<span class="pl-pds">&quot;</span></span>,<span class="pl-s"><span class="pl-pds">&quot;</span>variable<span class="pl-pds">&quot;</span></span>,<span class="pl-s"><span class="pl-pds">&quot;</span>m.iter<span class="pl-pds">&quot;</span></span>,<span class="pl-s"><span class="pl-pds">&quot;</span>RMSEobs<span class="pl-pds">&quot;</span></span>,<span class="pl-s"><span class="pl-pds">&quot;</span>RMSEimp<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L22" class="blob-num js-line-number" data-line-number="22"></td>
        <td id="LC22" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L23" class="blob-num js-line-number" data-line-number="23"></td>
        <td id="LC23" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L24" class="blob-num js-line-number" data-line-number="24"></td>
        <td id="LC24" class="blob-code blob-code-inner js-file-line"><span class="pl-k">for</span>(<span class="pl-smi">i</span> <span class="pl-k">in</span> <span class="pl-c1">1</span><span class="pl-k">:</span>length(<span class="pl-smi">impList</span>)){</td>
      </tr>
      <tr>
        <td id="L25" class="blob-num js-line-number" data-line-number="25"></td>
        <td id="LC25" class="blob-code blob-code-inner js-file-line">    print(paste(<span class="pl-s"><span class="pl-pds">&quot;</span>imputation set #<span class="pl-pds">&quot;</span></span>, <span class="pl-smi">i</span>))</td>
      </tr>
      <tr>
        <td id="L26" class="blob-num js-line-number" data-line-number="26"></td>
        <td id="LC26" class="blob-code blob-code-inner js-file-line">    <span class="pl-smi">imp</span><span class="pl-k">&lt;-</span><span class="pl-smi">impList</span>[[<span class="pl-smi">i</span>]]</td>
      </tr>
      <tr>
        <td id="L27" class="blob-num js-line-number" data-line-number="27"></td>
        <td id="LC27" class="blob-code blob-code-inner js-file-line">    <span class="pl-smi">impValues</span><span class="pl-k">&lt;-</span><span class="pl-smi">impList</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">imp</span></td>
      </tr>
      <tr>
        <td id="L28" class="blob-num js-line-number" data-line-number="28"></td>
        <td id="LC28" class="blob-code blob-code-inner js-file-line">    <span class="pl-k">for</span>(<span class="pl-smi">k</span> <span class="pl-k">in</span> <span class="pl-c1">5</span><span class="pl-k">:</span>length(<span class="pl-smi">impValues</span>)){</td>
      </tr>
      <tr>
        <td id="L29" class="blob-num js-line-number" data-line-number="29"></td>
        <td id="LC29" class="blob-code blob-code-inner js-file-line">      <span class="pl-k">for</span>(<span class="pl-smi">m.iter</span> <span class="pl-k">in</span> <span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-smi">impList</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">m</span>){</td>
      </tr>
      <tr>
        <td id="L30" class="blob-num js-line-number" data-line-number="30"></td>
        <td id="LC30" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">obs</span><span class="pl-k">&lt;-</span><span class="pl-smi">smallEval</span>[which(is.na(<span class="pl-smi">smallSpikeIn</span>[,<span class="pl-smi">k</span>])),<span class="pl-smi">k</span>]</td>
      </tr>
      <tr>
        <td id="L31" class="blob-num js-line-number" data-line-number="31"></td>
        <td id="LC31" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">imp.m</span><span class="pl-k">&lt;-</span><span class="pl-smi">impValues</span>[[<span class="pl-smi">k</span>]][,<span class="pl-smi">m.iter</span>]</td>
      </tr>
      <tr>
        <td id="L32" class="blob-num js-line-number" data-line-number="32"></td>
        <td id="LC32" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">comp</span><span class="pl-k">&lt;-</span>sample((<span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-smi">impList</span>[[<span class="pl-smi">i</span>]]<span class="pl-k">$</span><span class="pl-smi">m</span>)[<span class="pl-k">-</span><span class="pl-smi">m.iter</span>], <span class="pl-v">size</span> <span class="pl-k">=</span> <span class="pl-c1">1</span>)</td>
      </tr>
      <tr>
        <td id="L33" class="blob-num js-line-number" data-line-number="33"></td>
        <td id="LC33" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">imp.Comp</span><span class="pl-k">&lt;-</span><span class="pl-smi">impValues</span>[[<span class="pl-smi">k</span>]][,<span class="pl-smi">comp</span>]</td>
      </tr>
      <tr>
        <td id="L34" class="blob-num js-line-number" data-line-number="34"></td>
        <td id="LC34" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">RMSEobs</span><span class="pl-k">&lt;-</span>sqrt(mean((<span class="pl-smi">imp.m</span><span class="pl-k">-</span><span class="pl-smi">obs</span>)<span class="pl-k">^</span><span class="pl-c1">2</span>))</td>
      </tr>
      <tr>
        <td id="L35" class="blob-num js-line-number" data-line-number="35"></td>
        <td id="LC35" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">RMSEimp</span><span class="pl-k">&lt;-</span>sqrt(mean((<span class="pl-smi">imp.m</span><span class="pl-k">-</span><span class="pl-smi">imp.Comp</span>)<span class="pl-k">^</span><span class="pl-c1">2</span>))</td>
      </tr>
      <tr>
        <td id="L36" class="blob-num js-line-number" data-line-number="36"></td>
        <td id="LC36" class="blob-code blob-code-inner js-file-line">     </td>
      </tr>
      <tr>
        <td id="L37" class="blob-num js-line-number" data-line-number="37"></td>
        <td id="LC37" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">new.row</span><span class="pl-k">&lt;-</span>cbind.data.frame(<span class="pl-smi">imp</span><span class="pl-k">$</span><span class="pl-smi">method</span>[<span class="pl-c1">1</span>], names(<span class="pl-smi">impValues</span>)[<span class="pl-smi">k</span>], <span class="pl-smi">m.iter</span>, <span class="pl-smi">RMSEobs</span>, <span class="pl-smi">RMSEimp</span>)</td>
      </tr>
      <tr>
        <td id="L38" class="blob-num js-line-number" data-line-number="38"></td>
        <td id="LC38" class="blob-code blob-code-inner js-file-line">        <span class="pl-smi">variabilityTable</span><span class="pl-k">&lt;-</span>rbind(<span class="pl-smi">variabilityTable</span>, <span class="pl-smi">new.row</span>)</td>
      </tr>
      <tr>
        <td id="L39" class="blob-num js-line-number" data-line-number="39"></td>
        <td id="LC39" class="blob-code blob-code-inner js-file-line">    }</td>
      </tr>
      <tr>
        <td id="L40" class="blob-num js-line-number" data-line-number="40"></td>
        <td id="LC40" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L41" class="blob-num js-line-number" data-line-number="41"></td>
        <td id="LC41" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L42" class="blob-num js-line-number" data-line-number="42"></td>
        <td id="LC42" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L43" class="blob-num js-line-number" data-line-number="43"></td>
        <td id="LC43" class="blob-code blob-code-inner js-file-line">colnames(<span class="pl-smi">variabilityTable</span>)<span class="pl-k">&lt;-</span>c(<span class="pl-s"><span class="pl-pds">&quot;</span>method<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>variable<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>m.iter<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>RMSEobs<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>RMSEimp<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L44" class="blob-num js-line-number" data-line-number="44"></td>
        <td id="LC44" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">method</span><span class="pl-k">&lt;-</span><span class="pl-k">factor</span>(<span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">method</span>, <span class="pl-v">levels</span> <span class="pl-k">=</span> c( <span class="pl-s"><span class="pl-pds">&quot;</span>mean<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>norm.predict<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>sample<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>rf<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>ri<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>norm<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>norm.boot<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>norm.nob<span class="pl-pds">&quot;</span></span>,  <span class="pl-s"><span class="pl-pds">&quot;</span>pmm<span class="pl-pds">&quot;</span></span>))</td>
      </tr>
      <tr>
        <td id="L45" class="blob-num js-line-number" data-line-number="45"></td>
        <td id="LC45" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">variabilityTable</span><span class="pl-k">&lt;-</span><span class="pl-smi">variabilityTable</span>[order(<span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">method</span>), ]</td>
      </tr>
      <tr>
        <td id="L46" class="blob-num js-line-number" data-line-number="46"></td>
        <td id="LC46" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L47" class="blob-num js-line-number" data-line-number="47"></td>
        <td id="LC47" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">r2v</span><span class="pl-k">&lt;-</span>vector()</td>
      </tr>
      <tr>
        <td id="L48" class="blob-num js-line-number" data-line-number="48"></td>
        <td id="LC48" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">x</span><span class="pl-k">&lt;-</span>vector()</td>
      </tr>
      <tr>
        <td id="L49" class="blob-num js-line-number" data-line-number="49"></td>
        <td id="LC49" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">y</span><span class="pl-k">&lt;-</span>vector()</td>
      </tr>
      <tr>
        <td id="L50" class="blob-num js-line-number" data-line-number="50"></td>
        <td id="LC50" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L51" class="blob-num js-line-number" data-line-number="51"></td>
        <td id="LC51" class="blob-code blob-code-inner js-file-line"><span class="pl-k">for</span>(<span class="pl-smi">i</span> <span class="pl-k">in</span> levels(<span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">method</span>)){</td>
      </tr>
      <tr>
        <td id="L52" class="blob-num js-line-number" data-line-number="52"></td>
        <td id="LC52" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">data.sub</span><span class="pl-k">&lt;-</span>subset(<span class="pl-smi">variabilityTable</span>, <span class="pl-smi">method</span><span class="pl-k">==</span><span class="pl-smi">i</span>)</td>
      </tr>
      <tr>
        <td id="L53" class="blob-num js-line-number" data-line-number="53"></td>
        <td id="LC53" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"><span class="pl-c">#</span>params&lt;-summary(lm(RMSEobs ~ RMSEimp, data.sub))</span></td>
      </tr>
      <tr>
        <td id="L54" class="blob-num js-line-number" data-line-number="54"></td>
        <td id="LC54" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">r2</span><span class="pl-k">&lt;-</span>sqrt(mean((<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span><span class="pl-k">-</span><span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEimp</span>)<span class="pl-k">^</span><span class="pl-c1">2</span>))</td>
      </tr>
      <tr>
        <td id="L55" class="blob-num js-line-number" data-line-number="55"></td>
        <td id="LC55" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">r2</span><span class="pl-k">&lt;-</span>sprintf(<span class="pl-s"><span class="pl-pds">&quot;</span>%.2f<span class="pl-pds">&quot;</span></span>, round(<span class="pl-smi">r2</span>, <span class="pl-c1">3</span>))</td>
      </tr>
      <tr>
        <td id="L56" class="blob-num js-line-number" data-line-number="56"></td>
        <td id="LC56" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">add.r2</span><span class="pl-k">&lt;-</span>rep(<span class="pl-smi">r2</span>, nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L57" class="blob-num js-line-number" data-line-number="57"></td>
        <td id="LC57" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">r2v</span><span class="pl-k">&lt;-</span>c(<span class="pl-smi">r2v</span>, <span class="pl-smi">add.r2</span>)</td>
      </tr>
      <tr>
        <td id="L58" class="blob-num js-line-number" data-line-number="58"></td>
        <td id="LC58" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">x.add</span><span class="pl-k">&lt;-</span>rep(min(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>)<span class="pl-k">+</span>(max(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>)<span class="pl-k">-</span>min(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>))<span class="pl-k">*</span>.<span class="pl-c1">22</span>, nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L59" class="blob-num js-line-number" data-line-number="59"></td>
        <td id="LC59" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">y.add</span><span class="pl-k">&lt;-</span>rep(max(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEimp</span>)<span class="pl-k">-</span>(max(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>)<span class="pl-k">-</span>min(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>))<span class="pl-k">*</span>.<span class="pl-c1">1</span>, nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L60" class="blob-num js-line-number" data-line-number="60"></td>
        <td id="LC60" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">y.add</span><span class="pl-k">&lt;-</span>rep(max(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEimp</span>), nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L61" class="blob-num js-line-number" data-line-number="61"></td>
        <td id="LC61" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span>(<span class="pl-smi">i</span> <span class="pl-k">%in%</span> c(<span class="pl-s"><span class="pl-pds">&quot;</span>mean<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>norm.predict<span class="pl-pds">&quot;</span></span>)){</td>
      </tr>
      <tr>
        <td id="L62" class="blob-num js-line-number" data-line-number="62"></td>
        <td id="LC62" class="blob-code blob-code-inner js-file-line">    <span class="pl-smi">y.add</span><span class="pl-k">&lt;-</span>rep(.<span class="pl-c1">01</span>, nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L63" class="blob-num js-line-number" data-line-number="63"></td>
        <td id="LC63" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L64" class="blob-num js-line-number" data-line-number="64"></td>
        <td id="LC64" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">x</span><span class="pl-k">&lt;-</span>c(<span class="pl-smi">x</span>, <span class="pl-smi">x.add</span>)</td>
      </tr>
      <tr>
        <td id="L65" class="blob-num js-line-number" data-line-number="65"></td>
        <td id="LC65" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">y</span><span class="pl-k">&lt;-</span>c(<span class="pl-smi">y</span>, <span class="pl-smi">y.add</span>)</td>
      </tr>
      <tr>
        <td id="L66" class="blob-num js-line-number" data-line-number="66"></td>
        <td id="LC66" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L67" class="blob-num js-line-number" data-line-number="67"></td>
        <td id="LC67" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L68" class="blob-num js-line-number" data-line-number="68"></td>
        <td id="LC68" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L69" class="blob-num js-line-number" data-line-number="69"></td>
        <td id="LC69" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">r2</span><span class="pl-k">&lt;-</span><span class="pl-smi">r2v</span></td>
      </tr>
      <tr>
        <td id="L70" class="blob-num js-line-number" data-line-number="70"></td>
        <td id="LC70" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">x</span><span class="pl-k">&lt;-</span><span class="pl-smi">x</span></td>
      </tr>
      <tr>
        <td id="L71" class="blob-num js-line-number" data-line-number="71"></td>
        <td id="LC71" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">y</span><span class="pl-k">&lt;-</span><span class="pl-smi">y</span></td>
      </tr>
      <tr>
        <td id="L72" class="blob-num js-line-number" data-line-number="72"></td>
        <td id="LC72" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L73" class="blob-num js-line-number" data-line-number="73"></td>
        <td id="LC73" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L74" class="blob-num js-line-number" data-line-number="74"></td>
        <td id="LC74" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">input</span><span class="pl-k">&lt;-</span><span class="pl-smi">evalSetBoxCox</span>[<span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-c1">10000</span>,<span class="pl-k">-</span><span class="pl-c1">1</span>]</td>
      </tr>
      <tr>
        <td id="L75" class="blob-num js-line-number" data-line-number="75"></td>
        <td id="LC75" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">inputLong</span><span class="pl-k">&lt;-</span>melt(<span class="pl-smi">input</span>)</td>
      </tr>
      <tr>
        <td id="L76" class="blob-num js-line-number" data-line-number="76"></td>
        <td id="LC76" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">spike</span><span class="pl-k">&lt;-</span><span class="pl-smi">spikeInSetBoxCox</span>[<span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-c1">10000</span>,<span class="pl-k">-</span><span class="pl-c1">1</span>]</td>
      </tr>
      <tr>
        <td id="L77" class="blob-num js-line-number" data-line-number="77"></td>
        <td id="LC77" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">spikeLong</span><span class="pl-k">&lt;-</span>melt(<span class="pl-smi">spike</span>)</td>
      </tr>
      <tr>
        <td id="L78" class="blob-num js-line-number" data-line-number="78"></td>
        <td id="LC78" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">missing.i</span><span class="pl-k">&lt;-</span>which(is.na(<span class="pl-smi">spikeLong</span><span class="pl-k">$</span><span class="pl-smi">value</span>))</td>
      </tr>
      <tr>
        <td id="L79" class="blob-num js-line-number" data-line-number="79"></td>
        <td id="LC79" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L80" class="blob-num js-line-number" data-line-number="80"></td>
        <td id="LC80" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">folders</span><span class="pl-k">&lt;-</span>c(<span class="pl-s"><span class="pl-pds">&quot;</span>~/Downloads/10k2/<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>~/Downloads/output/<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L81" class="blob-num js-line-number" data-line-number="81"></td>
        <td id="LC81" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">methodsToCompare</span><span class="pl-k">&lt;-</span>intersect(dir(<span class="pl-smi">folders</span>[<span class="pl-c1">1</span>]), dir(<span class="pl-smi">folders</span>[<span class="pl-c1">2</span>]))</td>
      </tr>
      <tr>
        <td id="L82" class="blob-num js-line-number" data-line-number="82"></td>
        <td id="LC82" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">methodsSummaryStats</span><span class="pl-k">&lt;-</span><span class="pl-k">data.frame</span>(<span class="pl-k">matrix</span>(<span class="pl-v">nrow</span><span class="pl-k">=</span><span class="pl-c1">0</span>,<span class="pl-v">ncol</span> <span class="pl-k">=</span> <span class="pl-c1">5</span>))</td>
      </tr>
      <tr>
        <td id="L83" class="blob-num js-line-number" data-line-number="83"></td>
        <td id="LC83" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L84" class="blob-num js-line-number" data-line-number="84"></td>
        <td id="LC84" class="blob-code blob-code-inner js-file-line"><span class="pl-k">for</span>(<span class="pl-smi">i</span> <span class="pl-k">in</span> <span class="pl-c1">1</span><span class="pl-k">:</span>length(<span class="pl-smi">methodsToCompare</span>)){</td>
      </tr>
      <tr>
        <td id="L85" class="blob-num js-line-number" data-line-number="85"></td>
        <td id="LC85" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">f1</span><span class="pl-k">&lt;-</span>read.table(paste(<span class="pl-smi">folders</span>[<span class="pl-c1">1</span>], <span class="pl-smi">methodsToCompare</span>[<span class="pl-smi">i</span>], <span class="pl-v">sep</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>), <span class="pl-v">header</span> <span class="pl-k">=</span> <span class="pl-c1">F</span>, <span class="pl-v">sep</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>,<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L86" class="blob-num js-line-number" data-line-number="86"></td>
        <td id="LC86" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">f2</span><span class="pl-k">&lt;-</span>read.table(paste(<span class="pl-smi">folders</span>[<span class="pl-c1">2</span>], <span class="pl-smi">methodsToCompare</span>[<span class="pl-smi">i</span>], <span class="pl-v">sep</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>), <span class="pl-v">header</span> <span class="pl-k">=</span> <span class="pl-c1">F</span>, <span class="pl-v">sep</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>,<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L87" class="blob-num js-line-number" data-line-number="87"></td>
        <td id="LC87" class="blob-code blob-code-inner js-file-line">  colnames(<span class="pl-smi">f1</span>)<span class="pl-k">&lt;-</span>colnames(<span class="pl-smi">f2</span>)<span class="pl-k">&lt;-</span>colnames(<span class="pl-smi">input</span>)</td>
      </tr>
      <tr>
        <td id="L88" class="blob-num js-line-number" data-line-number="88"></td>
        <td id="LC88" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">f1Long</span><span class="pl-k">&lt;-</span>melt(<span class="pl-smi">f1</span>)</td>
      </tr>
      <tr>
        <td id="L89" class="blob-num js-line-number" data-line-number="89"></td>
        <td id="LC89" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">f2Long</span><span class="pl-k">&lt;-</span>melt(<span class="pl-smi">f2</span>)</td>
      </tr>
      <tr>
        <td id="L90" class="blob-num js-line-number" data-line-number="90"></td>
        <td id="LC90" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">chunk</span><span class="pl-k">&lt;-</span>cbind(rep(<span class="pl-smi">methodsToCompare</span>[<span class="pl-smi">i</span>], length(<span class="pl-smi">missing.i</span>)) , <span class="pl-smi">inputLong</span>[<span class="pl-smi">missing.i</span>,], <span class="pl-smi">f1Long</span><span class="pl-k">$</span><span class="pl-smi">value</span>[<span class="pl-smi">missing.i</span>], <span class="pl-smi">f2Long</span><span class="pl-k">$</span><span class="pl-smi">value</span>[<span class="pl-smi">missing.i</span>])</td>
      </tr>
      <tr>
        <td id="L91" class="blob-num js-line-number" data-line-number="91"></td>
        <td id="LC91" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">methodsSummaryStats</span><span class="pl-k">&lt;-</span>rbind(<span class="pl-smi">methodsSummaryStats</span>, <span class="pl-smi">chunk</span>)</td>
      </tr>
      <tr>
        <td id="L92" class="blob-num js-line-number" data-line-number="92"></td>
        <td id="LC92" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L93" class="blob-num js-line-number" data-line-number="93"></td>
        <td id="LC93" class="blob-code blob-code-inner js-file-line">colnames(<span class="pl-smi">methodsSummaryStats</span>)<span class="pl-k">&lt;-</span>c(<span class="pl-s"><span class="pl-pds">&quot;</span>method<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>variable<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>original<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>imp1<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>imp2<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L94" class="blob-num js-line-number" data-line-number="94"></td>
        <td id="LC94" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">methodsSummaryStats</span><span class="pl-k">$</span><span class="pl-smi">method</span><span class="pl-k">&lt;-</span>gsub(<span class="pl-v">pattern</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>completeCasesBoxCox_<span class="pl-pds">&quot;</span></span>, <span class="pl-v">replacement</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span><span class="pl-pds">&quot;</span></span>, <span class="pl-v">x</span> <span class="pl-k">=</span> <span class="pl-smi">methodsSummaryStats</span><span class="pl-k">$</span><span class="pl-smi">method</span>)</td>
      </tr>
      <tr>
        <td id="L95" class="blob-num js-line-number" data-line-number="95"></td>
        <td id="LC95" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L96" class="blob-num js-line-number" data-line-number="96"></td>
        <td id="LC96" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L97" class="blob-num js-line-number" data-line-number="97"></td>
        <td id="LC97" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">gd</span> <span class="pl-k">&lt;-</span> <span class="pl-smi">methodsSummaryStats</span> %<span class="pl-k">&gt;</span>%</td>
      </tr>
      <tr>
        <td id="L98" class="blob-num js-line-number" data-line-number="98"></td>
        <td id="LC98" class="blob-code blob-code-inner js-file-line">  group_by(<span class="pl-smi">variable</span>, <span class="pl-smi">method</span>) %<span class="pl-k">&gt;</span>% </td>
      </tr>
      <tr>
        <td id="L99" class="blob-num js-line-number" data-line-number="99"></td>
        <td id="LC99" class="blob-code blob-code-inner js-file-line">  summarise(</td>
      </tr>
      <tr>
        <td id="L100" class="blob-num js-line-number" data-line-number="100"></td>
        <td id="LC100" class="blob-code blob-code-inner js-file-line">    <span class="pl-v">x</span> <span class="pl-k">=</span> sqrt(mean((<span class="pl-smi">imp1</span><span class="pl-k">-</span><span class="pl-smi">original</span>)<span class="pl-k">^</span><span class="pl-c1">2</span>)),</td>
      </tr>
      <tr>
        <td id="L101" class="blob-num js-line-number" data-line-number="101"></td>
        <td id="LC101" class="blob-code blob-code-inner js-file-line">    <span class="pl-v">y</span> <span class="pl-k">=</span> sqrt(mean((<span class="pl-smi">imp1</span><span class="pl-k">-</span><span class="pl-smi">imp2</span>)<span class="pl-k">^</span><span class="pl-c1">2</span>))</td>
      </tr>
      <tr>
        <td id="L102" class="blob-num js-line-number" data-line-number="102"></td>
        <td id="LC102" class="blob-code blob-code-inner js-file-line">  )</td>
      </tr>
      <tr>
        <td id="L103" class="blob-num js-line-number" data-line-number="103"></td>
        <td id="LC103" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L104" class="blob-num js-line-number" data-line-number="104"></td>
        <td id="LC104" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L105" class="blob-num js-line-number" data-line-number="105"></td>
        <td id="LC105" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">gd</span><span class="pl-k">&lt;-</span><span class="pl-k">data.frame</span>(<span class="pl-v">method</span><span class="pl-k">=</span><span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">method</span>, <span class="pl-v">variable</span><span class="pl-k">=</span><span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">variable</span>, <span class="pl-v">m.iter</span><span class="pl-k">=</span>rep(<span class="pl-c1">1</span>, nrow(<span class="pl-smi">gd</span>)), <span class="pl-v">RMSEobs</span><span class="pl-k">=</span><span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">x</span>, <span class="pl-v">RMSEimp</span><span class="pl-k">=</span><span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">y</span>)</td>
      </tr>
      <tr>
        <td id="L106" class="blob-num js-line-number" data-line-number="106"></td>
        <td id="LC106" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">gd</span><span class="pl-k">&lt;-</span><span class="pl-smi">gd</span>[order(<span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">method</span>),]</td>
      </tr>
      <tr>
        <td id="L107" class="blob-num js-line-number" data-line-number="107"></td>
        <td id="LC107" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L108" class="blob-num js-line-number" data-line-number="108"></td>
        <td id="LC108" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">r2v</span><span class="pl-k">&lt;-</span>vector()</td>
      </tr>
      <tr>
        <td id="L109" class="blob-num js-line-number" data-line-number="109"></td>
        <td id="LC109" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">x</span><span class="pl-k">&lt;-</span>vector()</td>
      </tr>
      <tr>
        <td id="L110" class="blob-num js-line-number" data-line-number="110"></td>
        <td id="LC110" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">y</span><span class="pl-k">&lt;-</span>vector()</td>
      </tr>
      <tr>
        <td id="L111" class="blob-num js-line-number" data-line-number="111"></td>
        <td id="LC111" class="blob-code blob-code-inner js-file-line"><span class="pl-k">for</span>(<span class="pl-smi">i</span> <span class="pl-k">in</span> levels(<span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">method</span>)){</td>
      </tr>
      <tr>
        <td id="L112" class="blob-num js-line-number" data-line-number="112"></td>
        <td id="LC112" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">data.sub</span><span class="pl-k">&lt;-</span>subset(<span class="pl-smi">gd</span>, <span class="pl-smi">method</span><span class="pl-k">==</span><span class="pl-smi">i</span>)</td>
      </tr>
      <tr>
        <td id="L113" class="blob-num js-line-number" data-line-number="113"></td>
        <td id="LC113" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"><span class="pl-c">#</span>params&lt;-summary(lm(RMSEobs ~ RMSEimp, data.sub))</span></td>
      </tr>
      <tr>
        <td id="L114" class="blob-num js-line-number" data-line-number="114"></td>
        <td id="LC114" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">r2</span><span class="pl-k">&lt;-</span>sqrt(mean((<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span><span class="pl-k">-</span><span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEimp</span>)<span class="pl-k">^</span><span class="pl-c1">2</span>))</td>
      </tr>
      <tr>
        <td id="L115" class="blob-num js-line-number" data-line-number="115"></td>
        <td id="LC115" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">r2</span><span class="pl-k">&lt;-</span>sprintf(<span class="pl-s"><span class="pl-pds">&quot;</span>%.2f<span class="pl-pds">&quot;</span></span>, round(<span class="pl-smi">r2</span>, <span class="pl-c1">3</span>))</td>
      </tr>
      <tr>
        <td id="L116" class="blob-num js-line-number" data-line-number="116"></td>
        <td id="LC116" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">add.r2</span><span class="pl-k">&lt;-</span>rep(<span class="pl-smi">r2</span>, nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L117" class="blob-num js-line-number" data-line-number="117"></td>
        <td id="LC117" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">r2v</span><span class="pl-k">&lt;-</span>c(<span class="pl-smi">r2v</span>, <span class="pl-smi">add.r2</span>)</td>
      </tr>
      <tr>
        <td id="L118" class="blob-num js-line-number" data-line-number="118"></td>
        <td id="LC118" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">x.add</span><span class="pl-k">&lt;-</span>rep(min(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>)<span class="pl-k">+</span>(max(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>)<span class="pl-k">-</span>min(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>))<span class="pl-k">*</span>.<span class="pl-c1">22</span>, nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L119" class="blob-num js-line-number" data-line-number="119"></td>
        <td id="LC119" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">y.add</span><span class="pl-k">&lt;-</span>rep(max(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEimp</span>)<span class="pl-k">-</span>(max(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>)<span class="pl-k">-</span>min(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEobs</span>))<span class="pl-k">*</span>.<span class="pl-c1">1</span>, nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L120" class="blob-num js-line-number" data-line-number="120"></td>
        <td id="LC120" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">y.add</span><span class="pl-k">&lt;-</span>rep(max(<span class="pl-smi">data.sub</span><span class="pl-k">$</span><span class="pl-smi">RMSEimp</span>), nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L121" class="blob-num js-line-number" data-line-number="121"></td>
        <td id="LC121" class="blob-code blob-code-inner js-file-line">  <span class="pl-k">if</span>(<span class="pl-smi">i</span> <span class="pl-k">%in%</span> c(<span class="pl-s"><span class="pl-pds">&quot;</span>knn_751.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>si_s_8.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>simple_median.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>svd_2.csv<span class="pl-pds">&quot;</span></span>)){</td>
      </tr>
      <tr>
        <td id="L122" class="blob-num js-line-number" data-line-number="122"></td>
        <td id="LC122" class="blob-code blob-code-inner js-file-line">    <span class="pl-smi">y.add</span><span class="pl-k">&lt;-</span>rep(.<span class="pl-c1">01</span>, nrow(<span class="pl-smi">data.sub</span>))</td>
      </tr>
      <tr>
        <td id="L123" class="blob-num js-line-number" data-line-number="123"></td>
        <td id="LC123" class="blob-code blob-code-inner js-file-line">  }</td>
      </tr>
      <tr>
        <td id="L124" class="blob-num js-line-number" data-line-number="124"></td>
        <td id="LC124" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">x</span><span class="pl-k">&lt;-</span>c(<span class="pl-smi">x</span>, <span class="pl-smi">x.add</span>)</td>
      </tr>
      <tr>
        <td id="L125" class="blob-num js-line-number" data-line-number="125"></td>
        <td id="LC125" class="blob-code blob-code-inner js-file-line">  <span class="pl-smi">y</span><span class="pl-k">&lt;-</span>c(<span class="pl-smi">y</span>, <span class="pl-smi">y.add</span>)</td>
      </tr>
      <tr>
        <td id="L126" class="blob-num js-line-number" data-line-number="126"></td>
        <td id="LC126" class="blob-code blob-code-inner js-file-line">}</td>
      </tr>
      <tr>
        <td id="L127" class="blob-num js-line-number" data-line-number="127"></td>
        <td id="LC127" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">r2</span><span class="pl-k">&lt;-</span><span class="pl-smi">r2v</span></td>
      </tr>
      <tr>
        <td id="L128" class="blob-num js-line-number" data-line-number="128"></td>
        <td id="LC128" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">x</span><span class="pl-k">&lt;-</span><span class="pl-smi">x</span></td>
      </tr>
      <tr>
        <td id="L129" class="blob-num js-line-number" data-line-number="129"></td>
        <td id="LC129" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">gd</span><span class="pl-k">$</span><span class="pl-smi">y</span><span class="pl-k">&lt;-</span><span class="pl-smi">y</span></td>
      </tr>
      <tr>
        <td id="L130" class="blob-num js-line-number" data-line-number="130"></td>
        <td id="LC130" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L131" class="blob-num js-line-number" data-line-number="131"></td>
        <td id="LC131" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">all.results</span><span class="pl-k">&lt;-</span>rbind(<span class="pl-smi">variabilityTable</span>, <span class="pl-smi">gd</span>)</td>
      </tr>
      <tr>
        <td id="L132" class="blob-num js-line-number" data-line-number="132"></td>
        <td id="LC132" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">methodsComp</span><span class="pl-k">&lt;-</span>c(<span class="pl-s"><span class="pl-pds">&quot;</span>sample<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>mean<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>simple_median.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>knn_751.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>svd_2.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>si_s_8.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>mice_col_lambda_reg_1.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>mice_pmm_lambda_reg_001.csv<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>norm.predict<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>rf<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>pmm<span class="pl-pds">&quot;</span></span>, <span class="pl-s"><span class="pl-pds">&quot;</span>norm<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L133" class="blob-num js-line-number" data-line-number="133"></td>
        <td id="LC133" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">sub.results</span><span class="pl-k">&lt;-</span>subset(<span class="pl-smi">all.results</span>, <span class="pl-smi">method</span> <span class="pl-k">%in%</span> <span class="pl-smi">methodsComp</span>)</td>
      </tr>
      <tr>
        <td id="L134" class="blob-num js-line-number" data-line-number="134"></td>
        <td id="LC134" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L135" class="blob-num js-line-number" data-line-number="135"></td>
        <td id="LC135" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">p1</span><span class="pl-k">&lt;-</span>ggplot(<span class="pl-smi">sub.results</span>, aes(<span class="pl-v">x</span><span class="pl-k">=</span><span class="pl-smi">RMSEobs</span>, <span class="pl-v">y</span><span class="pl-k">=</span><span class="pl-smi">RMSEimp</span>, <span class="pl-v">col</span><span class="pl-k">=</span><span class="pl-smi">variable</span>))<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L136" class="blob-num js-line-number" data-line-number="136"></td>
        <td id="LC136" class="blob-code blob-code-inner js-file-line">  geom_point()<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L137" class="blob-num js-line-number" data-line-number="137"></td>
        <td id="LC137" class="blob-code blob-code-inner js-file-line">  facet_wrap( <span class="pl-k">~</span> <span class="pl-smi">method</span>, <span class="pl-v">ncol</span> <span class="pl-k">=</span> <span class="pl-c1">4</span>, <span class="pl-v">scales</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>free<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L138" class="blob-num js-line-number" data-line-number="138"></td>
        <td id="LC138" class="blob-code blob-code-inner js-file-line">  xlab(<span class="pl-s"><span class="pl-pds">&quot;</span>RMSE vs observed<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L139" class="blob-num js-line-number" data-line-number="139"></td>
        <td id="LC139" class="blob-code blob-code-inner js-file-line">  ylab(<span class="pl-s"><span class="pl-pds">&quot;</span>RMSE vs imputed<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L140" class="blob-num js-line-number" data-line-number="140"></td>
        <td id="LC140" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"><span class="pl-c">#</span>xlim(0, max(c(variabilityTable$RMSEobs, variabilityTable$RMSEimp)))+</span></td>
      </tr>
      <tr>
        <td id="L141" class="blob-num js-line-number" data-line-number="141"></td>
        <td id="LC141" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"><span class="pl-c">#</span>ylim(0, max(c(variabilityTable$RMSEobs, variabilityTable$RMSEimp)))+</span></td>
      </tr>
      <tr>
        <td id="L142" class="blob-num js-line-number" data-line-number="142"></td>
        <td id="LC142" class="blob-code blob-code-inner js-file-line">  geom_abline(<span class="pl-v">slope</span> <span class="pl-k">=</span> <span class="pl-c1">1</span>, <span class="pl-v">intercept</span> <span class="pl-k">=</span> <span class="pl-c1">0</span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L143" class="blob-num js-line-number" data-line-number="143"></td>
        <td id="LC143" class="blob-code blob-code-inner js-file-line">  scale_color_discrete(<span class="pl-s"><span class="pl-pds">&quot;</span>LOINC Code<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L144" class="blob-num js-line-number" data-line-number="144"></td>
        <td id="LC144" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"><span class="pl-c">#</span>ggtitle(&quot;Error Vs. Variability&quot;)+</span></td>
      </tr>
      <tr>
        <td id="L145" class="blob-num js-line-number" data-line-number="145"></td>
        <td id="LC145" class="blob-code blob-code-inner js-file-line">  theme_bw()</td>
      </tr>
      <tr>
        <td id="L146" class="blob-num js-line-number" data-line-number="146"></td>
        <td id="LC146" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L147" class="blob-num js-line-number" data-line-number="147"></td>
        <td id="LC147" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L148" class="blob-num js-line-number" data-line-number="148"></td>
        <td id="LC148" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">rsqs</span><span class="pl-k">&lt;-</span>paste0(<span class="pl-s"><span class="pl-pds">&quot;</span>MD ==<span class="pl-pds">&quot;</span></span>, <span class="pl-smi">sub.results</span><span class="pl-k">$</span><span class="pl-smi">r2</span>)</td>
      </tr>
      <tr>
        <td id="L149" class="blob-num js-line-number" data-line-number="149"></td>
        <td id="LC149" class="blob-code blob-code-inner js-file-line">  </td>
      </tr>
      <tr>
        <td id="L150" class="blob-num js-line-number" data-line-number="150"></td>
        <td id="LC150" class="blob-code blob-code-inner js-file-line">png(<span class="pl-s"><span class="pl-pds">&quot;</span>~/plots/imputation/figuresForPaper/figure5_temp2.png<span class="pl-pds">&quot;</span></span>, <span class="pl-v">res</span> <span class="pl-k">=</span> <span class="pl-c1">300</span>, <span class="pl-v">width</span> <span class="pl-k">=</span> <span class="pl-c1">12</span>, <span class="pl-v">height</span> <span class="pl-k">=</span> <span class="pl-c1">7</span>, <span class="pl-v">units</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>in<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L151" class="blob-num js-line-number" data-line-number="151"></td>
        <td id="LC151" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">p1</span><span class="pl-k">+</span>geom_text(aes(<span class="pl-v">x</span><span class="pl-k">=</span><span class="pl-smi">sub.results</span><span class="pl-k">$</span><span class="pl-smi">x</span>,<span class="pl-v">y</span><span class="pl-k">=</span><span class="pl-smi">sub.results</span><span class="pl-k">$</span><span class="pl-smi">y</span>,<span class="pl-v">label</span><span class="pl-k">=</span>as.character(<span class="pl-smi">rsqs</span>)), <span class="pl-v">parse</span> <span class="pl-k">=</span> <span class="pl-c1">TRUE</span>, <span class="pl-v">size</span><span class="pl-k">=</span><span class="pl-c1">4</span>, <span class="pl-v">col</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">&quot;</span>black<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L152" class="blob-num js-line-number" data-line-number="152"></td>
        <td id="LC152" class="blob-code blob-code-inner js-file-line">dev.off()</td>
      </tr>
      <tr>
        <td id="L153" class="blob-num js-line-number" data-line-number="153"></td>
        <td id="LC153" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L154" class="blob-num js-line-number" data-line-number="154"></td>
        <td id="LC154" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L155" class="blob-num js-line-number" data-line-number="155"></td>
        <td id="LC155" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L156" class="blob-num js-line-number" data-line-number="156"></td>
        <td id="LC156" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">p1</span><span class="pl-k">+</span>geom_text(aes(<span class="pl-v">x</span><span class="pl-k">=</span><span class="pl-smi">sub.results</span><span class="pl-k">$</span><span class="pl-smi">x</span>,<span class="pl-v">y</span><span class="pl-k">=</span><span class="pl-smi">sub.results</span><span class="pl-k">$</span><span class="pl-smi">y</span>, <span class="pl-v">label</span><span class="pl-k">=</span>paste(<span class="pl-s"><span class="pl-pds">&quot;</span>R^2 == <span class="pl-pds">&quot;</span></span>, <span class="pl-smi">sub.results</span><span class="pl-k">$</span><span class="pl-smi">r2</span>)), <span class="pl-v">inherit.aes</span> <span class="pl-k">=</span> <span class="pl-c1">FALSE</span>, <span class="pl-v">show.legend</span> <span class="pl-k">=</span> <span class="pl-c1">FALSE</span>)</td>
      </tr>
      <tr>
        <td id="L157" class="blob-num js-line-number" data-line-number="157"></td>
        <td id="LC157" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">p1</span><span class="pl-k">+</span>geom_text(aes(<span class="pl-v">x</span><span class="pl-k">=</span><span class="pl-smi">sub.results</span><span class="pl-k">$</span><span class="pl-smi">x</span>,<span class="pl-v">y</span><span class="pl-k">=</span><span class="pl-smi">sub.results</span><span class="pl-k">$</span><span class="pl-smi">y</span>,<span class="pl-v">label</span><span class="pl-k">=</span>as.character(<span class="pl-smi">rsqs</span>)), <span class="pl-v">parse</span> <span class="pl-k">=</span> <span class="pl-c1">TRUE</span>, <span class="pl-v">size</span><span class="pl-k">=</span><span class="pl-c1">4</span>, <span class="pl-v">col</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">&quot;</span>black<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L158" class="blob-num js-line-number" data-line-number="158"></td>
        <td id="LC158" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L159" class="blob-num js-line-number" data-line-number="159"></td>
        <td id="LC159" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L160" class="blob-num js-line-number" data-line-number="160"></td>
        <td id="LC160" class="blob-code blob-code-inner js-file-line">png(<span class="pl-s"><span class="pl-pds">&quot;</span>~/plots/imputation/fancyImputeErrorVsVariability.png<span class="pl-pds">&quot;</span></span>, <span class="pl-v">res</span> <span class="pl-k">=</span> <span class="pl-c1">300</span>, <span class="pl-v">width</span> <span class="pl-k">=</span> <span class="pl-c1">16</span>, <span class="pl-v">height</span> <span class="pl-k">=</span> <span class="pl-c1">9</span>, <span class="pl-v">units</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>in<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L161" class="blob-num js-line-number" data-line-number="161"></td>
        <td id="LC161" class="blob-code blob-code-inner js-file-line">ggplot(<span class="pl-smi">gd</span>, aes( <span class="pl-v">x</span><span class="pl-k">=</span><span class="pl-smi">x</span>, <span class="pl-v">y</span><span class="pl-k">=</span><span class="pl-smi">y</span>, <span class="pl-v">color</span><span class="pl-k">=</span><span class="pl-smi">variable</span>))<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L162" class="blob-num js-line-number" data-line-number="162"></td>
        <td id="LC162" class="blob-code blob-code-inner js-file-line">  geom_point()<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L163" class="blob-num js-line-number" data-line-number="163"></td>
        <td id="LC163" class="blob-code blob-code-inner js-file-line">  xlim(<span class="pl-c1">0</span>, <span class="pl-c1">2</span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L164" class="blob-num js-line-number" data-line-number="164"></td>
        <td id="LC164" class="blob-code blob-code-inner js-file-line">  ylim(<span class="pl-c1">0</span>, <span class="pl-c1">2</span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L165" class="blob-num js-line-number" data-line-number="165"></td>
        <td id="LC165" class="blob-code blob-code-inner js-file-line">  facet_wrap(<span class="pl-k">~</span><span class="pl-smi">method</span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L166" class="blob-num js-line-number" data-line-number="166"></td>
        <td id="LC166" class="blob-code blob-code-inner js-file-line">  geom_abline(<span class="pl-v">slope</span> <span class="pl-k">=</span> <span class="pl-c1">1</span>, <span class="pl-v">intercept</span> <span class="pl-k">=</span> <span class="pl-c1">0</span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L167" class="blob-num js-line-number" data-line-number="167"></td>
        <td id="LC167" class="blob-code blob-code-inner js-file-line">  xlab(<span class="pl-s"><span class="pl-pds">&quot;</span>RMSE Observed Vs. Imputed1<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L168" class="blob-num js-line-number" data-line-number="168"></td>
        <td id="LC168" class="blob-code blob-code-inner js-file-line">  ylab(<span class="pl-s"><span class="pl-pds">&quot;</span>RMSE Imputed1 Vs. Imputed2<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L169" class="blob-num js-line-number" data-line-number="169"></td>
        <td id="LC169" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L170" class="blob-num js-line-number" data-line-number="170"></td>
        <td id="LC170" class="blob-code blob-code-inner js-file-line">  theme_bw()</td>
      </tr>
      <tr>
        <td id="L171" class="blob-num js-line-number" data-line-number="171"></td>
        <td id="LC171" class="blob-code blob-code-inner js-file-line">dev.off()</td>
      </tr>
      <tr>
        <td id="L172" class="blob-num js-line-number" data-line-number="172"></td>
        <td id="LC172" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L173" class="blob-num js-line-number" data-line-number="173"></td>
        <td id="LC173" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">labels.data</span><span class="pl-k">&lt;-</span><span class="pl-k">data.frame</span>(<span class="pl-v">x</span> <span class="pl-k">=</span> rep(<span class="pl-c1">1.4</span>,<span class="pl-c1">1260</span>), <span class="pl-v">y</span><span class="pl-k">=</span>rep(<span class="pl-c1">1.1</span>,<span class="pl-c1">1260</span>), <span class="pl-v">method</span><span class="pl-k">=</span> levels(<span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">method</span>), <span class="pl-v">labs</span><span class="pl-k">=</span><span class="pl-c1">LETTERS</span>[<span class="pl-c1">1</span><span class="pl-k">:</span><span class="pl-c1">9</span>])</td>
      </tr>
      <tr>
        <td id="L174" class="blob-num js-line-number" data-line-number="174"></td>
        <td id="LC174" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L175" class="blob-num js-line-number" data-line-number="175"></td>
        <td id="LC175" class="blob-code blob-code-inner js-file-line">png(<span class="pl-s"><span class="pl-pds">&quot;</span>~/plots/imputation/miceRerrorVsVariabilityColMat6zerosGlobalScales.png<span class="pl-pds">&quot;</span></span>, <span class="pl-v">res</span> <span class="pl-k">=</span> <span class="pl-c1">300</span>, <span class="pl-v">width</span> <span class="pl-k">=</span> <span class="pl-c1">8</span>, <span class="pl-v">height</span> <span class="pl-k">=</span> <span class="pl-c1">4.5</span>, <span class="pl-v">units</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>in<span class="pl-pds">&quot;</span></span>)</td>
      </tr>
      <tr>
        <td id="L176" class="blob-num js-line-number" data-line-number="176"></td>
        <td id="LC176" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">p2</span><span class="pl-k">&lt;-</span>ggplot(subset(<span class="pl-smi">variabilityTable</span>, <span class="pl-smi">method</span><span class="pl-k">!=</span><span class="pl-s"><span class="pl-pds">&quot;</span>quadratic<span class="pl-pds">&quot;</span></span>), aes(<span class="pl-v">x</span><span class="pl-k">=</span><span class="pl-smi">RMSEobs</span>, <span class="pl-v">y</span><span class="pl-k">=</span><span class="pl-smi">RMSEimp</span>, <span class="pl-v">col</span><span class="pl-k">=</span><span class="pl-smi">variable</span>))<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L177" class="blob-num js-line-number" data-line-number="177"></td>
        <td id="LC177" class="blob-code blob-code-inner js-file-line">  geom_point()<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L178" class="blob-num js-line-number" data-line-number="178"></td>
        <td id="LC178" class="blob-code blob-code-inner js-file-line">  facet_wrap( <span class="pl-k">~</span> <span class="pl-smi">method</span>, <span class="pl-v">ncol</span> <span class="pl-k">=</span> <span class="pl-c1">3</span>, <span class="pl-v">scales</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">&quot;</span>free<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L179" class="blob-num js-line-number" data-line-number="179"></td>
        <td id="LC179" class="blob-code blob-code-inner js-file-line">  xlab(<span class="pl-s"><span class="pl-pds">&quot;</span>RMSE vs observed<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L180" class="blob-num js-line-number" data-line-number="180"></td>
        <td id="LC180" class="blob-code blob-code-inner js-file-line">  ylab(<span class="pl-s"><span class="pl-pds">&quot;</span>RMSE vs imputed<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L181" class="blob-num js-line-number" data-line-number="181"></td>
        <td id="LC181" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"><span class="pl-c">#</span>xlim(0, max(c(variabilityTable$RMSEobs, variabilityTable$RMSEimp)))+</span></td>
      </tr>
      <tr>
        <td id="L182" class="blob-num js-line-number" data-line-number="182"></td>
        <td id="LC182" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"><span class="pl-c">#</span>ylim(0, max(c(variabilityTable$RMSEobs, variabilityTable$RMSEimp)))+</span></td>
      </tr>
      <tr>
        <td id="L183" class="blob-num js-line-number" data-line-number="183"></td>
        <td id="LC183" class="blob-code blob-code-inner js-file-line">  geom_abline(<span class="pl-v">slope</span> <span class="pl-k">=</span> <span class="pl-c1">1</span>, <span class="pl-v">intercept</span> <span class="pl-k">=</span> <span class="pl-c1">0</span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L184" class="blob-num js-line-number" data-line-number="184"></td>
        <td id="LC184" class="blob-code blob-code-inner js-file-line">  scale_color_discrete(<span class="pl-s"><span class="pl-pds">&quot;</span>LOINC Code<span class="pl-pds">&quot;</span></span>)<span class="pl-k">+</span></td>
      </tr>
      <tr>
        <td id="L185" class="blob-num js-line-number" data-line-number="185"></td>
        <td id="LC185" class="blob-code blob-code-inner js-file-line">  <span class="pl-c"><span class="pl-c">#</span>ggtitle(&quot;Error Vs. Variability&quot;)+</span></td>
      </tr>
      <tr>
        <td id="L186" class="blob-num js-line-number" data-line-number="186"></td>
        <td id="LC186" class="blob-code blob-code-inner js-file-line">  theme_bw()</td>
      </tr>
      <tr>
        <td id="L187" class="blob-num js-line-number" data-line-number="187"></td>
        <td id="LC187" class="blob-code blob-code-inner js-file-line">dev.off()</td>
      </tr>
      <tr>
        <td id="L188" class="blob-num js-line-number" data-line-number="188"></td>
        <td id="LC188" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L189" class="blob-num js-line-number" data-line-number="189"></td>
        <td id="LC189" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L190" class="blob-num js-line-number" data-line-number="190"></td>
        <td id="LC190" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L191" class="blob-num js-line-number" data-line-number="191"></td>
        <td id="LC191" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L192" class="blob-num js-line-number" data-line-number="192"></td>
        <td id="LC192" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L193" class="blob-num js-line-number" data-line-number="193"></td>
        <td id="LC193" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L194" class="blob-num js-line-number" data-line-number="194"></td>
        <td id="LC194" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">p2</span><span class="pl-k">+</span>geom_text(aes(<span class="pl-v">x</span><span class="pl-k">=</span><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">x</span>,<span class="pl-v">y</span><span class="pl-k">=</span><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">y</span>, <span class="pl-v">label</span><span class="pl-k">=</span>paste(expression(<span class="pl-smi">R</span><span class="pl-k">^</span><span class="pl-c1">2</span>), <span class="pl-s"><span class="pl-pds">&quot;</span> = <span class="pl-pds">&quot;</span></span>, <span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">r2</span>)), <span class="pl-v">inherit.aes</span> <span class="pl-k">=</span> <span class="pl-c1">FALSE</span>, <span class="pl-v">show.legend</span> <span class="pl-k">=</span> <span class="pl-c1">FALSE</span>)</td>
      </tr>
      <tr>
        <td id="L195" class="blob-num js-line-number" data-line-number="195"></td>
        <td id="LC195" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">p2</span><span class="pl-k">+</span>geom_text(aes(<span class="pl-v">x</span><span class="pl-k">=</span><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">x</span>,<span class="pl-v">y</span><span class="pl-k">=</span><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">y</span>, <span class="pl-v">label</span><span class="pl-k">=</span>bquote(<span class="pl-smi">R</span><span class="pl-k">^</span><span class="pl-c1">2</span> <span class="pl-k">~</span> <span class="pl-s"><span class="pl-pds">&quot;</span>=<span class="pl-pds">&quot;</span></span> <span class="pl-k">~</span>.(<span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">r2</span>))), <span class="pl-v">inherit.aes</span> <span class="pl-k">=</span> <span class="pl-c1">FALSE</span>, <span class="pl-v">show.legend</span> <span class="pl-k">=</span> <span class="pl-c1">FALSE</span>)</td>
      </tr>
      <tr>
        <td id="L196" class="blob-num js-line-number" data-line-number="196"></td>
        <td id="LC196" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L197" class="blob-num js-line-number" data-line-number="197"></td>
        <td id="LC197" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">vals</span><span class="pl-k">&lt;-</span><span class="pl-smi">variabilityTable</span><span class="pl-k">$</span><span class="pl-smi">r2</span></td>
      </tr>
      <tr>
        <td id="L198" class="blob-num js-line-number" data-line-number="198"></td>
        <td id="LC198" class="blob-code blob-code-inner js-file-line">bquote(<span class="pl-smi">R</span><span class="pl-k">^</span><span class="pl-c1">2</span> <span class="pl-k">~</span> <span class="pl-s"><span class="pl-pds">&quot;</span>=<span class="pl-pds">&quot;</span></span> <span class="pl-k">~</span>.(<span class="pl-smi">vals</span>))</td>
      </tr>
      <tr>
        <td id="L199" class="blob-num js-line-number" data-line-number="199"></td>
        <td id="LC199" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L200" class="blob-num js-line-number" data-line-number="200"></td>
        <td id="LC200" class="blob-code blob-code-inner js-file-line">Sys.time()<span class="pl-k">-</span><span class="pl-smi">tic</span></td>
      </tr>
      <tr>
        <td id="L201" class="blob-num js-line-number" data-line-number="201"></td>
        <td id="LC201" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">file_name</span> <span class="pl-k">&lt;-</span> paste(<span class="pl-s"><span class="pl-pds">&#39;</span>../output/R<span class="pl-pds">&#39;</span></span>, <span class="pl-smi">args</span>[<span class="pl-c1">1</span>], <span class="pl-v">sep</span><span class="pl-k">=</span><span class="pl-s"><span class="pl-pds">&#39;</span>_<span class="pl-pds">&#39;</span></span>)</td>
      </tr>
      <tr>
        <td id="L202" class="blob-num js-line-number" data-line-number="202"></td>
        <td id="LC202" class="blob-code blob-code-inner js-file-line">print(<span class="pl-smi">file_name</span>)</td>
      </tr>
      <tr>
        <td id="L203" class="blob-num js-line-number" data-line-number="203"></td>
        <td id="LC203" class="blob-code blob-code-inner js-file-line"><span class="pl-smi">eval.df</span> <span class="pl-k">&lt;-</span> <span class="pl-k">data.frame</span>(<span class="pl-k">matrix</span>(unlist(<span class="pl-smi">eval_list</span>)))</td>
      </tr>
      <tr>
        <td id="L204" class="blob-num js-line-number" data-line-number="204"></td>
        <td id="LC204" class="blob-code blob-code-inner js-file-line">rownames(<span class="pl-smi">eval.df</span>) <span class="pl-k">&lt;-</span> <span class="pl-smi">impMethod</span></td>
      </tr>
      <tr>
        <td id="L205" class="blob-num js-line-number" data-line-number="205"></td>
        <td id="LC205" class="blob-code blob-code-inner js-file-line">write.csv(<span class="pl-smi">eval.df</span>, <span class="pl-v">file</span><span class="pl-k">=</span><span class="pl-smi">file_name</span>)</td>
      </tr>
      <tr>
        <td id="L206" class="blob-num js-line-number" data-line-number="206"></td>
        <td id="LC206" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L207" class="blob-num js-line-number" data-line-number="207"></td>
        <td id="LC207" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
      <tr>
        <td id="L208" class="blob-num js-line-number" data-line-number="208"></td>
        <td id="LC208" class="blob-code blob-code-inner js-file-line">
</td>
      </tr>
</table>

  </div>

</div>

<button type="button" data-facebox="#jump-to-line" data-facebox-class="linejump" data-hotkey="l" class="d-none">Jump to Line</button>
<div id="jump-to-line" style="display:none">
  <!-- '"` --><!-- </textarea></xmp> --></option></form><form accept-charset="UTF-8" action="" class="js-jump-to-line-form" method="get"><div style="margin:0;padding:0;display:inline"><input name="utf8" type="hidden" value="&#x2713;" /></div>
    <input class="form-control linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" aria-label="Jump to line" autofocus>
    <button type="submit" class="btn">Go</button>
</form></div>


  </div>
  <div class="modal-backdrop js-touch-events"></div>
</div>

    </div>
  </div>

  </div>

      
<div class="container site-footer-container">
  <div class="site-footer " role="contentinfo">
    <ul class="site-footer-links float-right">
        <li><a href="https://github.com/contact" data-ga-click="Footer, go to contact, text:contact">Contact GitHub</a></li>
      <li><a href="https://developer.github.com" data-ga-click="Footer, go to api, text:api">API</a></li>
      <li><a href="https://training.github.com" data-ga-click="Footer, go to training, text:training">Training</a></li>
      <li><a href="https://shop.github.com" data-ga-click="Footer, go to shop, text:shop">Shop</a></li>
        <li><a href="https://github.com/blog" data-ga-click="Footer, go to blog, text:blog">Blog</a></li>
        <li><a href="https://github.com/about" data-ga-click="Footer, go to about, text:about">About</a></li>

    </ul>

    <a href="https://github.com" aria-label="Homepage" class="site-footer-mark" title="GitHub">
      <svg aria-hidden="true" class="octicon octicon-mark-github" height="24" version="1.1" viewBox="0 0 16 16" width="24"><path fill-rule="evenodd" d="M8 0C3.58 0 0 3.58 0 8c0 3.54 2.29 6.53 5.47 7.59.4.07.55-.17.55-.38 0-.19-.01-.82-.01-1.49-2.01.37-2.53-.49-2.69-.94-.09-.23-.48-.94-.82-1.13-.28-.15-.68-.52-.01-.53.63-.01 1.08.58 1.23.82.72 1.21 1.87.87 2.33.66.07-.52.28-.87.51-1.07-1.78-.2-3.64-.89-3.64-3.95 0-.87.31-1.59.82-2.15-.08-.2-.36-1.02.08-2.12 0 0 .67-.21 2.2.82.64-.18 1.32-.27 2-.27.68 0 1.36.09 2 .27 1.53-1.04 2.2-.82 2.2-.82.44 1.1.16 1.92.08 2.12.51.56.82 1.27.82 2.15 0 3.07-1.87 3.75-3.65 3.95.29.25.54.73.54 1.48 0 1.07-.01 1.93-.01 2.2 0 .21.15.46.55.38A8.013 8.013 0 0 0 16 8c0-4.42-3.58-8-8-8z"/></svg>
</a>
    <ul class="site-footer-links">
      <li>&copy; 2017 <span title="0.20666s from unicorn-1437573634-gt1cd">GitHub</span>, Inc.</li>
        <li><a href="https://github.com/site/terms" data-ga-click="Footer, go to terms, text:terms">Terms</a></li>
        <li><a href="https://github.com/site/privacy" data-ga-click="Footer, go to privacy, text:privacy">Privacy</a></li>
        <li><a href="https://github.com/security" data-ga-click="Footer, go to security, text:security">Security</a></li>
        <li><a href="https://status.github.com/" data-ga-click="Footer, go to status, text:status">Status</a></li>
        <li><a href="https://help.github.com" data-ga-click="Footer, go to help, text:help">Help</a></li>
    </ul>
  </div>
</div>



  <div id="ajax-error-message" class="ajax-error-message flash flash-error">
    <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/></svg>
    <button type="button" class="flash-close js-flash-close js-ajax-error-dismiss" aria-label="Dismiss error">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
    </button>
    You can't perform that action at this time.
  </div>


    
    <script crossorigin="anonymous" integrity="sha256-c3IPAnuzF/zrEYwlknXaS+Xvo0TCRqEjQaaMMWjO6qc=" src="https://assets-cdn.github.com/assets/frameworks-73720f027bb317fceb118c259275da4be5efa344c246a12341a68c3168ceeaa7.js"></script>
    <script async="async" crossorigin="anonymous" integrity="sha256-RxzCT0EPRethTgXhTxGeeueFEqdaNXksnP1uIDJytlg=" src="https://assets-cdn.github.com/assets/github-471cc24f410f45eb614e05e14f119e7ae78512a75a35792c9cfd6e203272b658.js"></script>
    
    
    
    
  <div class="js-stale-session-flash stale-session-flash flash flash-warn flash-banner d-none">
    <svg aria-hidden="true" class="octicon octicon-alert" height="16" version="1.1" viewBox="0 0 16 16" width="16"><path fill-rule="evenodd" d="M8.865 1.52c-.18-.31-.51-.5-.87-.5s-.69.19-.87.5L.275 13.5c-.18.31-.18.69 0 1 .19.31.52.5.87.5h13.7c.36 0 .69-.19.86-.5.17-.31.18-.69.01-1L8.865 1.52zM8.995 13h-2v-2h2v2zm0-3h-2V6h2v4z"/></svg>
    <span class="signed-in-tab-flash">You signed in with another tab or window. <a href="">Reload</a> to refresh your session.</span>
    <span class="signed-out-tab-flash">You signed out in another tab or window. <a href="">Reload</a> to refresh your session.</span>
  </div>
  <div class="facebox" id="facebox" style="display:none;">
  <div class="facebox-popup">
    <div class="facebox-content" role="dialog" aria-labelledby="facebox-header" aria-describedby="facebox-description">
    </div>
    <button type="button" class="facebox-close js-facebox-close" aria-label="Close modal">
      <svg aria-hidden="true" class="octicon octicon-x" height="16" version="1.1" viewBox="0 0 12 16" width="12"><path fill-rule="evenodd" d="M7.48 8l3.75 3.75-1.48 1.48L6 9.48l-3.75 3.75-1.48-1.48L4.52 8 .77 4.25l1.48-1.48L6 6.52l3.75-3.75 1.48 1.48z"/></svg>
    </button>
  </div>
</div>


  </body>
</html>

