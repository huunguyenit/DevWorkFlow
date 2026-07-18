<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Check "if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end
select @message as message
return">

  <!ENTITY k1 "ma_dvcs = @ma_dvcs and ma_vt = @ma_vt">
  <!ENTITY k2 "ma_dvcs = $ma_dvcs.OldValue and ma_vt = $ma_vt.OldValue">
  <!ENTITY k3 "@ma_dvcs = $ma_dvcs.OldValue and @ma_vt = $ma_vt.OldValue">
]>

<dir table="dmvtxktd" code="ma_dvcs, ma_vt" order="ma_dvcs, ma_vt" xmlns="urn:schemas-fast-com:data-dir">
  <title v="vật tư xuất kho tự động" e="Declaration Item for Auto-Generated Issue"></title>
  <fields>
    <field name="ma_dvcs" allowNulls="false" isPrimaryKey="true" clientDefault="Default" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1) and status = '1'" check="ma_dvcs in (select ma_dvcs from sysunitrights where user_id = @@userID and r_new = 1)" information="ma_dvcs$dmdvcs.ten_dvcs%l"/>
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_vt" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã vật tư" e="Item"></header>
      <items style="AutoComplete" controller="Item" reference="ten_vt%l" key="loai_vt in ('21', '41', '51') and status = '1'" check="loai_vt in ('21', '41', '51')" information="ma_vt$dmvt.ten_vt%l" new="Default"/>
    </field>
    <field name="ten_vt%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 330"/>
      <item value="1101: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="1101: [ma_vt].Label, [ma_vt], [ten_vt%l]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2fTth6QC9ICNGXfDAqzmu/EWSMyG4Vpr096pqvJUQFNExKQJFbbbGN2n47s6QyqzOfsmXtiNLdOj6lDNLKzO+oXsxqZeaq27wErAHfbmdd9Jz3Py/+hJX5k2Cu/FLEv1OWvW3qGVnM7w/MGIj9JwW7qqJAWoMHXWuHR2QAIA+WvJtI7AWPoJ/Pp2r7bVOh3aQf6cUDyV+U5aaRZfQquU4Fa</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOgzUofwBKJKNsSNPvcducwJKxmL4Mbm2P3KP8dCR/pt9BF/EWByLTYk156Q1PYA1f</encrypted>]]>
        &Check;
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WX8Fc1dBAbLrEymztvySg01/pS35Z7AdHNjQqDOgPBbfDluFxrwODqYQGRmMWZulikA8iMgv+3GbRrLR/gtJDK9vV136FT4HDnQ/BhzvtFlMpJi7Vm6xH/Pxac5wTlJFtEnCrOcwGP0VnB4CZPjOPqZz7sJiPQ0G1aSA/n57sHPTre2bc4pvbgiZFo9oJE5TOmAJNf66lA/oza5VEttiGuiX/2ARlAOY7zsQfxilS89XYzIiQ2MP151y4KIjm4j7VnRsN8QT3Rtjpuk2Ak5ls9VQgD4oev27FtVi9MmoWNQCveQP2BvBI1r/YxKb6g0vkFHFA99bOM4DcCFO0ge439v8WjxmK+JCpRvJez33sL547iGRPFLn3grztAx96WtWlxwZMw1SHC2W+eScYIwUvpgOQcY7UwrranDdyHIKaSk/4FHDCHELRapousz1SAi48e2fOhWY6YwaYP/nR0Q+uWuSkhjJ5C1l2XCcbSEusH98=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3chGulZx9js/QAMlXiOyoG+w==</encrypted>]]>&k1;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmgCX+9Jr+KibQ8txfwhIDwno81zjJQZL1viHHIMDc52yTt6ZiaWZRegoJdNcGXqRQ5IoyIkn6aL2aw4Qhrg1zRX7Kbizrsq6dphPvfPkrSMxcno7+euTt9GqAZaXWg/tYep/T9W9aJcrZS5L5XBvddGbEodAls70R0PHU4gtf/+8C7oasi75zs0YNC3m2p94V0=</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jHIfhvN/FgzGs7XWCpp4tNw==</encrypted>]]>&k2;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cN+5r5DGxhHZBSzn67khvmgCX+9Jr+KibQ8txfwhIDwnKM73fdBkSu8ApL7DvaHSDkR1KBDGflw6/rh1xGfDlChXXFf+m8S0QuY66XXHkHHIYJW6l4ogBvkmzwYYC/5X7OH9RWQHOkE3SNOplsvdy2FW0r9sh8Wo3gu/sR3uwCX5</encrypted>]]>&k3;<![CDATA[<encrypted>%cnASWSum4IkRBTbKLOi8cE/hpETWHna8gLwEu3sbtN4/gTNFFQu0uenpQvEOpfKoA8BXgYv+XlcbaaPH73mettoZpAz+NNAqLnHv1RGPtqo=</encrypted>]]>&k1;<![CDATA[<encrypted>%LpK0+C7Z27eMbRoQwsVpHXUZPhZejoSanSW5VqAEj4k=</encrypted>]]>&k2;<![CDATA[<encrypted>%ynJ3B2IMttZ3swIzstMMYbqlZD4zfaX6Mwe4vIA/i8a29Uj1vL+i3p5KfysAi8rKv5W/nX0nml/eKY5vpy5eXLKCSArNUn2VjYa/zuDgwmjbM7zXMA8KXDpHMOHq14GYnqIN6uqxcGOf9FsVC3zymzjZfZKmskRGDw0W8N5uILw=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/mowDkppyEm+M695XoSYtPbWFQxy+iGfcw7MzL9FMDgydsN7TUG3H9lfencUe1tR5ukFyTFzk0HxwI4sQCx1Us=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeqMboCxcWZPqmgVHI4rxdBdE5v2XLyIc5gSWiGIG4xro</encrypted>]]>&k1;<![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70FZ7Du3m7Rny2+OPmYoEles=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF88DTU2hhFgDUM0bkA2rvTjL4wqIf5fbw/9vcm5CLoY9duPQL6KvSDo8b5vdamyEXCUz+bJYH1FkO0fVOHix7K9Sm4a74m9LCX+5ptz2gEDE=</encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70Np0sFOmsenpE70+PvVmSSqWNFEKvPvv0Ydyyn6K5NO5ukk5vCQbodG0anGGneduxg/tHM8mxS+It+xwz6G06UAPYZDDDZALKUlrcqoBoNlFaPd4AiW0amYYN0OsMZqb/B5ysSnicprkfxfGZeO1cjzi6jiWJ01FJLVoAJTrd0nyjMrAAekUpvnljkZlWZ6AXd/oe1c4Hf2ZDvFqZYIvWjc8OlDpHFZ7UGbkf0J6Ab7i9IsHMkhG30fWTkNPbTUi/DPzNhQfqwPmHjuLDFgEfRk=</encrypted>]]>
    </text>
  </script>

</dir>