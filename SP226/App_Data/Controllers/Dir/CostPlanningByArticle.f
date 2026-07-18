<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBalanceBeforeEdit "if @@view = 0 begin
  if @@action = 'Edit' begin
    if @@admin &lt;&gt; 1 begin
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @ma_dvcs and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
    declare @$lockedDate nvarchar(512)
    select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa sổ.' else N'Data is locked, you must modify system locked date.' end
    if exists(select 1 from dmstt where year(ngay_ks) >= @nam) begin
      select @message as script, @$lockedDate as message
      return
    end
    if exists(select 1 from dmdvcsks where ma_dvcs = @ma_dvcs and year(ngay_ks) >= @nam) begin
	    select @message as script, @$lockedDate as message
	  return
    end
  end
end">
]>

<dir table="dtkhct" code="ma_dvcs, nam, ma_vv, ma_so" order="ma_dvcs, nam, ma_vv, ma_so" xmlns="urn:schemas-fast-com:data-dir">
  <title v="kế hoạch" e="Planning"></title>
  <fields>
    <field name="ma_dvcs" isPrimaryKey="true" dataFormatString="@upperCaseFormat" inactivate="true" disabled="true">
      <header v="Đơn vị" e="Unit"></header>
      <items style="AutoComplete" controller="Unit" reference="ten_dvcs%l" key="status='1'" check="1=1" information="ma_dvcs$dmdvcs.ten_dvcs%l" />
    </field>
    <field name="ten_dvcs%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="nam" type="Decimal" isPrimaryKey="true" dataFormatString="###0" allowNulls="false">
      <header v="Năm" e="Year"></header>
      <items style="Numeric"/>
    </field>
    <field name="ma_vv" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Công trình" e="Project"></header>
      <items style="AutoComplete" controller="Job" reference="ten_vv%l" key="status = '1'" check="1=1" information="ma_vv$dmvv.ten_vv%l" new="Default"/>
    </field>
    <field name="ten_vv%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="ma_so" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Chỉ tiêu" e="Article"></header>
      <items style="AutoComplete" controller="Article" reference="chi_tieu%l" key="status = '1'" check="1=1" information="ma_so$dtdmct.chi_tieu%l"/>
    </field>
    <field name="chi_tieu%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="tien" type="Decimal" dataFormatString="@baseCurrencyAmountInputFormat" align="right">
      <header v="Tiền" e="Amount"></header>
      <items style="Numeric"/>
    </field>
    <field name="tien_nt" type="Decimal" dataFormatString="@foreignCurrencyAmountInputFormat" align="right">
      <header v="Tiền nt" e="FC Amount"></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 40, 60, 330"/>
      <item value="1101: [ma_dvcs].Label, [ma_dvcs], [ten_dvcs%l]"/>
      <item value="11--: [nam].Label, [nam]"/>
      <item value="1101: [ma_vv].Label, [ma_vv], [ten_vv%l]"/>
      <item value="1101: [ma_so].Label, [ma_so], [chi_tieu%l]"/>
      <item value="110-: [tien].Label, [tien]"/>
      <item value="110-: [tien_nt].Label, [tien_nt]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6Ki3sgDAlbfjfySSmm689l5LSWRRkurjA0uvoAu/1soyjoB2nAeGJ05gFnP/en54qVpe0t4VBT9G7UblCld24o7GyNhFY7/74s5LmbXSAaG</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2fTth6QC9ICNGXfDAqzmu/EWSMyG4Vpr096pqvJUQFNExKQJFbbbGN2n47s6QyqzOfsmXtiNLdOj6lDNLKzO+oXsxqZeaq27wErAHfbmdd9Jz3Py/+hJX5k2Cu/FLEv1OWvW3qGVnM7w/MGIj9JwW7qp+hpdBHR56ggW8DnjAeNnyh/SHmodSciSFyARqeSBdBkIhMj67Z/9Ootd3K3frotcmDy2ENwmCG+tl9fiahAuA==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOcohgHuteLZf5XEtl+tXC5MsZKMir3Fzws9mmzVAHndlJgH8FIqE5idYVRLFNTzxPz36DIWhtU3tDWz5MueO7Mw==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI6FkIk8XSExM9lBejhiqEOVaoGjev516x8Oe3BIufijq6z6s6Aqz540JaYT/vW8VWkedbbfmCUsZ7bYa02uut8p9meW7ICPkQ0cwPVAbEqqwW+jyey5mOg/+jwx6CtBSSniFXMi/hYhtHk43YPNvC1qSjhbqdwQWVGz8uf4mtxPyzaFAUVlorEKLFt22xBe3pZJo/ovHOeqzEhgSuQBFHENkWIT0D7NmA2rpNfqiAm5TCxqtoEcNZS2hcBmRaXpIfctUTt1W1voRSWh45lXy7qGhZO7Pf2I+VNAksaK/7ijEokIrzOhdodsClD02jE+AGxELayL9ElpBPMjzv1Ds4M4elsn6TH1q7AvY3pNCdvRRGOhWwQmhXJ/yTeamGKgP7G2isRppl1svQz7k6yi/RmLILW5CT+Cp+hIuB2fQ81J4p5km5uTXPpZdnPc8pVUWasdfM7/07sKFUmo+TaZ3XBBC47PuUUegOVMYG1pjYNiPzTyNZh55uQDpjO21GKZU94JVPleFZy7uSdqP4mrvgoObM/EQK6KaPcuSWhDJAjnqEJ+9Ycvi8ONv3itIaScT9Q==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6vRm09t9j7HQnFuuOykf8tyXCr1eir6iVFB8BR4uuPmgLiJC7zohKr9NXxN/zvweGbzUezMHEs4WCxpxz5RotrjyO8EJFQvIPg5UxVQG2D9di4jkJJdPx68fJTZmefOyG0IUpXJLs2EGm8GzSEr0I9k7hD0xI0FHKGo3tJTpyrzz36LVsMJZpzrMf4Jnew3SvWWEnF1JNk17dYwHfgYLF7biHWgF6hR+4yFqqlkWzhO9rKucYdYqRp9jOVJzPTO121BaCC1kITuz+kYINarq6HDowHYjSbyjU2NvMZ+fP3CQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CK5sMfhwq7ewtaVXBpzL2kZB9K7FH+5F7kbGqkcq2m9rNclbObzUmRPSdXIvjlhQE1yBOLkStoLn+Rge1DPSDvM1/T5Ao8JlJp/xIfP0NBnxmu8wjpHJ+jJ+4+yfbepsDHqb/oIwGHh3TCy68lC56zMceCN76nCEB+e9SYS86pRGuEhhatAJA6qm2GrHRaT/1p6XUh6Kpu9mAHZkL9KvCGPqhP99ryuqRYwF4zkEd92Y4DPI345q4Di5mv10OfW0QS32HB+Jm4ODNmNoGrcdWonxbQYoEIdKZXqcx/yTkq8gpaWgSrRK+HBPkf0vIWDBjleg4OciRrOxO3PTWjeUmqgm5k/HJO2UIT7so4iZX565Y3Y+Xbkv3kuonxgELiWAEVkYBRuuRj6Fy7kaLXJtdwgJKwhoK0SHri67Kn10f3Ye7OQdqxgRCxm2jxJBPD8beQvCISqbbQx8h4SYaeitRifoyt4PmHk4+0pNUrs+Y6N3uAsPxaGm14VCkmZVsjV1jorB4wPJl4gWI3nOu1nc4c</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/FUDXW2R3LN70Al5xHlFXlyH2dME+kKk+GfwWHxhsNObtwH8JZXyFc6v3zxZpvGbIY=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF88DTU2hhFgDUM0bkA2rvTjL4wqIf5fbw/9vcm5CLoY9duPQL6KvSDo8b5vdamyEXIa5GF9WkqML9MPF8M0+2nCjYAplPRMtNqMQEOawYJizNGIgMBefNj58pygbbH/IeptxxnjPA9Vgn+P/d+CDS9vV0rOmz2qUrHWZEkvY0R3ZG8i7I1668Lc2+k/d7Lunt</encrypted>]]>
      </text>
    </command>

  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HLnsx1Lexw/DIykUn5mI0/lIsgXWmfg3EtSTEgan5huBxhbTawIsdwrWrVR6q3z3mGSrP8/1x7a+EzNBbnOWjO2sMXxwLW6M61WUIHD/NXuuzlG3wRw3Toib5wBrsX56TRXyR23AOXUVfCqWcx0ypTFHLc6lzdeVZ09XvTQ6bYy7RkG+6F5cZ+1rVUyFeBlGyZ3o9zNdevQX6ghumkMT5AeGH8PsyPDXUfZJFsYWzK5jaBPpCK6OBqQUIrTKcS9VTEPL1LuRG5b2DqjK+XsBHOPwhoKUnXaXzU+AnyLRMfH</encrypted>]]>
    </text>
  </script>

</dir>