
[<< back](README.md)

1. [Run test](#1-run-test)
2. [Command options](#2-command-options)
3. [Choosing config file](#3-choosing-config-file)

# 1. Run test

Description: Running Teuton test located into `example/learn-01-target` folder.

Usage:

```bash
teuton run example/learn-01-target
```

Example:

```bash
> teuton run examples/learn-01-target

==================================
Executing [teuton] (version 2.1.9)
[INFO] Running in parallel (2020-04-19 14:09:41 +0100)
.
[INFO] Duration = 0.004    (2020-04-19 14:09:41 +0100)
==================================

INITIAL CONFIGURATIONS
+---------------+-------------------------------------------+
| tt_title      | Executing [teuton] (version 2.1.9)        |
| tt_scriptname | examples/learn-01-target/start.rb         |
| tt_configfile | examples/learn-01-target/config.yaml      |
| tt_pwd        | /mnt/home/leap/proy/repos/teuton.d/teuton |
| tt_testname   | learn-01-target                           |
| tt_sequence   | false                                     |
+---------------+-------------------------------------------+

CASE RESULTS
+------+-----------+-------+-------+
| CASE | MEMBERS   | GRADE | STATE |
| 01   | anonymous | 100.0 |       |
+------+-----------+-------+-------+

FINAL VALUES
+-------------+---------------------------+
| start_time  | 2020-04-19 14:09:41 +0100 |
| finish_time | 2020-04-19 14:09:41 +0100 |
| duration    | 0.004231917               |
+-------------+---------------------------+
```

# 2. Command options

Usage: `teuton help run`

```
Usage:
  teuton [run] [OPTIONS] DIRECTORY

Options:
  [--export=EXPORT]        
  [--cname=CNAME]          
  [--cpath=CPATH]          
  [--case=CASE]            
  [--color], [--no-color]  
  [--quiet], [--no-quiet]     
```

| ID | Command              | Descriptiont |
| -- | -------------------- | ------------ |
| 01 | teuton foo           | Run foo/start.rb, with config file foo/config.yaml |
| 02 | teuton run foo      | Run foo/start.rb, with config file foo/config.yaml |
| 03 | ruby teuton foo      | Same as 01 on Windows OS |
| 04 | ruby teuton run foo | Same as 02 on WIndows OS |
| 05 | teuton . | Run ./start.rb with ./config.yaml file |
| 06 | teuton run --export=json foo | Run foo/start.rb and force json format during exporting. Others output formats availables are: txt, colored_text, json, yaml |
| 07 | teuton run --cname=rock foo | Run foo/start.rb with foo/rock.yaml config file |
| 08 | teuton foo/demo42.rb | Run foo/demo42.rb with foo/demo42.yaml config file |
| 08 | teuton run --cpath=starwars/jedi.yaml foo | Run foo/start.rb with starwars/jedi.yaml config file |
| 09 | teuton run --case=6,16 foo | Run foo/start.rb with foo/config.yaml config file but only for case id '06' and '16' |

# 3. Choosing config file

**Default names:**:
By default, when you run `teuton run foo`, this will search for:
* `foo/start.rb` test file and
* `foo/config.yaml` config file.

**Using cname param:**
It's posible execute `teuton run --cname=rock foo`, and choose diferent config file into projet folder:
* `foo/start.rb` test file and
* `foo/rock.yaml` config file.

> `cname` param searchs YAML config file into the same project folder.

**Using cpath param:**
An also, it's posible execute `teuton run --cpath=/home/david/startwars.yaml foo`, and choose config file using its absolute path:
* `foo/start.rb` test file and
* `/home/david/starwars.yaml` config file.

> `cpath` param selects YAML config file, from the specified path.

**Using diferent main rb name:**
When you execute `teuton run foo/mazingerz.rb`, this will search for:
* `foo/mazingerz.rb` test file and
* `foo/mazingerz.yaml` config file.
