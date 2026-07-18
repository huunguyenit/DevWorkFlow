<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\TransferField.txt">
  <!ENTITY TransferID "PaymentForm">
]>

<dir table="dmmauunc" code="ma_mau" order="ma_mau" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tải lên" e="Upload"></title>

  <fields>
    &UploadField;
    <field name="ma_mau" hidden="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ma_mau]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+eDyBirbZYhxNg7IK0LzDARU1RhgJhToOOTKO2lFKP5K0iv7NDHuY5glcfYocJ75uP44CLYXO+9KqcG7FD8stY=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1x6FXR599IsoIgyTrAbWShf91rXqeLNNv8cP1NTE8nWDkQKG3YMUYvjfq0nalsL2bz5Dq2YQG5zae0lsXexl/I=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwXIw3VSIf86IPRZxKCm519abg00vfs+gA+boPKiwBc1yT5ffiJvpt38psieml7N2jlir0y6QU8eSzwdmF3eqXY=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Am8Jvv1DRVW5XC9+pNe2Ne2jWQJbh0DEZ7N611nnGMAPMVaubpICQwIBwKxkBBdwJwUuHnXaOpBhCIbrw8rh75+bqOUhmb5b1yx1lHUgn3lRMcONjnPVbogYBI97NtGOhnB4UXDliZJ3JOemieD6gEnemFQtTstdWmlYC9SvdpUyJD8NHu/8oy3hwjvHcQ9mUxuQpv3zydl/JgGblmlGeY3X7jCNTZYr3PcvgKr2LXF6achxmjT0Esw72RcAMpSfFIWPBo65txYjB5IUWPod2V21mQAUQ365q2dAaEycXZBwP7c0juXxEHXouCND45MGjAuH932kD5wxGb3WbwTxYbETpwEbV9LDoNMNhd7uKNYrsW8SzwEeKA7ExYxt+j5McDssSxyWNKUn3aUaSbzlx3c8lx0XoXwLCUn6yJiE0b0wZoNuQNOLMyYJHqQJnzrqQ==</encrypted>]]>&TransferID;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV1qNbAJ/FtOAfWIZH9g/33+8b4mxjlPwcNwOrmHtfi8Wfq/hS8NYXCtA/LE8rvtEPO6NSnXu1bpqEkqvXOOUYPPOicbLzUrbjhS6LKMsSa7tJvew7YDtHxgLLGgXWHfEUziKSWaFkZJIgWecuEPFDdUSIA7ci1aVDYvoa/ZLeXE/khQ0wwocvIR0Ns6rrZwyPh7COaIw4TsVjmlr6O4l+qKoX5hvgy5ikxDxErauWLBvsHfP5YCSz7JUb5VFQ/foF12E5H+An3T/L3veOZkAaW9AOVTgz/tVi6rOP/aBoe7SNp0skzb4mm8KtN/H5ACZYEo3BS6XO26tlbSGaxaQkBI=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70NHYeYeMe1Pc569ZkUA2naZl9jWe0+kRpRz6peFS6OLMVoqG3EDLhvFO7A4IdVNEshD0elaP3t2HFT3CxEuCZ0JJf7EpyXR9fBuGL2t6lEHVuuMuL2Xfy+z8MUFP3/NLJnbDcnJ9BF3X9GpKCkvicHRm7blryS6CYRQjc3snaYa0o4jFwW/1ouJe9ItCnQvSrUndkYpSAQgnljFlhgFN8YJT+41aH5aRqtuaihDTa0V1QDtsWnvfyZPi/MF733Z4RO1PUgB17gPwFpsoyxQG2zM6AcR7mmyziIUwSHHJaoNqkTr6ez3q4JDikB/WdnIMiZatFxA+o05/n6qAYTkF3gJlS6baHu0nPRE+FR/CYh2emlz89rq8fkFYKW2wDpAttgNz5ZwaCQv24c/NUc/aINif8esuNLsfuYm0iweGGwveGhRJDRymcpJ4QlNHUKi3HZmKFuJ4nadDWVfeIdH/5srFHcj+0Kd89FDRtj/Z9yx6bfhFoUZex1nPdyBnwOU9ulgblfWQOxqzQceXgO0zwC3mG0wM9Xl4y3fp22NaRMVyhyPu9FNJj6/npoW6995PL6VJoP6Wf8WoGeEN/a2KABEBGeJmjYtPfYlZiWBuHc5hEFL9FpH+inqjtTCBqNpF9VIFWn0fPKvbwP+kCsctIeT+8KCvnYgKVhzkXEoP1qs1VY4WMW/UsVQkgc3XZ1RgBMNi0QPsl/aZTyVBr+tjBj3USPoHQWHXqLC/UBiE8gDDDNM8hb0DQA+JQGF+cCHxvaWhFLWYHSCFXLHtGrmh1oRrGLmd5EARgX1/ZIonIXPA/B0yPQ07iboO0NG4a6qXAHVXbXkfBh02xFlp4FBEc4WmfkJO3+DnfRnaQtMAE7RPzLz6bc/qX0DdSAthXZQfzJGtF4y69XTiZl8DEtSNaxNpXzsRA7h8QJzNFlccpEjqKQLP4CbdKGXm+ch0ifouE6rD/ehhgWm6PdFdzkLTqqMuHErcZNkIX+MBAL0QzMJrWCIuM6LyqO8r1jPQbMHjgovW8FYdtYqQ3tjjtCJo06efQErsJER/gsobDYlpdz5t</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Upload">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fy6sUzURmsO5tjzZvhg2qWduJUsyX/wPtoVh4ZB/IPWhBBfNkw6tmXibVQjMZuVyRPgrdfISWnxBpr4sCcUiIL8oCEVsT2mc+N8UW80/128poPXI6FgoNxmNiPtnrJHiG5pU/f3jo6pTEIl+nNTeUBx+t/Os81xGoApdSDNCmlSVkmsuBtEzfkFzUZuzY5NvV9dD0r18Dn/t2Gd60eiONA=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%MGU5qpqemPLrmLoSOTmcILWxh5VfZsKFdu++vU39xJUip1s6/Qc3k7+bWmR8HTXVU7nGr1QhnBueZ+eadVTxaStd3pDMuautY751Dedvt+cTrqtBea0fdMrlVnhMT/pIbVN/Oh/rdHDkqvUBgH9QSRiv9ta66irdBtwUirXZL+tLiDd+sEf+WeVOjj4Y/uyrYNs6V8uzduibsSgcJOb3OqmtnqS+3/uK6zpvsTh+KnLSRslTntPZiPJv/2gdFMMcCPpUJZi1DqFfxdlyHBK9FHgn/IGnAeW3g1I6YVnin8Wcoqr6xr+HTNBMfOyDGybpt32QUbh9tWyVDQ3lbhhLUg==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>