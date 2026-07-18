<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Key "declare @rk varchar(16)
select @rk = rkey from @@sysDatabaseName..userinfo2 where id = @@userID">
]>

<dir table="dmscsl" code="id" order="id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tải dữ liệu xuống" e="Download"></title>
  <fields>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP6gpvuU4grDF4XxT6mlSIgB9WdsB3fP8f7O4k1rvSZ32ILN8/Bhb2ZJIck+v2QyV9M=</encrypted>]]></clientScript>
    </field>

    <field name="chkpass" type="Int32" external="true" defaultValue="0" allowContain="true" inactivate="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="209">
      <item value="120, 100, 100, 230, 0, 0"/>
      <item value="110-1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2Cb9DEg9VFeHZcrozoMSzfFD/WNKZN8bu6KUHfZEi7FA/IWwrW9WuoHjxBQJar+vCXGJ+ZW3lkhztcNAnf7f/DVKtisZlLZbIZASiARNVA5p2SDkygO4RxRUaAPze58vw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxofxlfzvPc09UahCXkyZPAbvCsJdiqC6ypM3bJtx4RP8NENnFvi16C5f5rixfedk6nkY9iYWfMV2g+uVwoq8vc=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70LBBxTxVo2wdYrIJzAd/YcC9NbpJekWxiFVMLD+8Fr07zui+H1rtFtE/S5Ue4r54P1Avbx4zOI3lZBShVhS88+uKH64YtRGOVOqSUZXemezYSI1H2bbDJ8aJWDsgqZKpQO0UcCjvQlFPTkpesLrH6DrubSZ1X3lNVlZ6JhxxnY7Rc6rHlP5igLEWDgeTRqh7JxgCwnwqILowDyiby7bFlyo=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FCqeYHhE1ax5nXv08ZrZw5qvT+1dX2QNzYOBlWk9Pd2EyZjQTZDjfSNWA4ZdtHuyLVu6bQ7u6K25u7JxEQYmWfKc3qrj22OqX/roZ4VRWtHGQNB6LqPHb0SpV3fs3NubyTJNvBYX7ZvZdHMtZUp/MXNmBmL5cUszmMdc2ZPv5bgTVHLqeIjkToI+93QDnSJI2xM6j+qbR91QoWHW+Bi0LhJzr+g0OrjJPLBa8X7sc8MJ8CsiZv9gD0z8B5d2ic6bK2W9m++16n6dgSLRYAQInKUHj//GY+LfPe7XZcKOB+DhheGqtSiPzl6p4maGVfxPaPhOLL35y7np5iFBOYj4kTPjgSdSQfN9Zi69J19Lktqz46jDsNrB06pJtrPMKWuJb6VHATJIpia1PEE/ZlYJZjqdwtHPnafo0PiMc+UvaT8yHCMScFLALihaqSkXY6yvzbQaaYrg4/4w18l4FsDAkpuwx3pYxJRzBXL+YPyGCC07+fMLGFjMk7ydMwdBQ4LKXYuMcBTsz9mSncFDxvfNhq9kkevZymgQiVjl1LxenLEbAVbCKiRw/qqQcPnLyNn03ERrGXv2cw7BobckRJtNcBZ4TgNq8lB2wEnRG/gp/JVMf8hR0YFfglfkk2tvGyHaJQ+IhvYetUTyOxQTpG6tzbsfpiU+MK85Mf3GL7xE2Z1KEpYr6ITRiFJTdJJzHxLs5XuFzD2sCG3f/JlA0gKUMJ7OE3mf7lwQrdRjpJ8d1TYnmrMh6/TVYBIWic6Xf/u47wSF7KWoYSH6plNaNWldymIux32iiumINK9BCS4XKJW5iF7GVV7Bx+AETeTQsYLcvDXYuZ5kqCym93R794C0Mnf646kpxeJKIkqODWP/QjKKJzQBUvOCE5tU6kYsd/KJ+nOq6vqzgo5tjdF59f4E2q9caJBnumFSK8ELA37m6DIJ1HYajhQ+s1QPKeTOD6xhdtncUIqqrUG8+C2mXSqfIqCv2w1OtbQdYPxmvqij2Bww7wwv9e6nFbcjlxNcCz9vWv0wGfnfI4Vzg0yk6syFsFPhsKI/ox8Fr73NVXivs2xs7N3yBF4cUtneozf5JJyyL+X5cWeu1eok9WJmcmplcI=</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Key">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5cBdf+Y6fnghL241kyDz6YVX/jV68KjRqPZfYObLs198eJ7N163RjkeuXcCXYvGag==</encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fItCfd1XXCUKgCP18muw0gx3W6dMAOelI5pTk4UrnWkD1r/vFI732v7WtX/RuPqd6CuIWT7ndfc5zx8xIhb+Lq9Qz+zhNCkOFGLcltsCKQOhPwDGQVkHntl/qVPom3RTzQlKBomxVQEq+LJArPGEc3ugvcMcxBxg9uFnTiFdSGk/2gG8/LI8tPWB909tgMeJQ==</encrypted>]]>
      </text>
    </action>
  </response>
</dir>