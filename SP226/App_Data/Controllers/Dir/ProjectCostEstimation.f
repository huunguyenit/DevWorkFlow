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

<dir table="dtdtvv" code="ma_dvcs, nam, ma_vv" order="ma_dvcs, nam, ma_vv" xmlns="urn:schemas-fast-com:data-dir">
  <title v="dự toán" e="Estimation"></title>
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
      <item value="110-: [tien].Label, [tien]"/>
      <item value="110-: [tien_nt].Label, [tien_nt]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7jOjw8yeN37+7dzBTcR5ZudlhFquvz09KuQCOJkbuXl1KqXn/eYpYv4/slCgV3LR290KAvNRyLWuUg3mqA7ipCT+qyGxSHw3DsJ6iYRbuQW</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZgJkw7M0ADa6mad427Rdou7rbij1W55cpzU2s4UlFXzHSBYbk4laDHPQjprcPQF2fTth6QC9ICNGXfDAqzmu/EWSMyG4Vpr096pqvJUQFNExKQJFbbbGN2n47s6QyqzOfsmXtiNLdOj6lDNLKzO+oXsxqZeaq27wErAHfbmdd9Jz3Py/+hJX5k2Cu/FLEv1OWvW3qGVnM7w/MGIj9JwW7qNeWl5ALPjKlr4/d2XY3DtO4uI3d6OJhxwCnN1RvxyM8V9QOODEPuJb/OKQzoaKBEixX8PYN/XD5BkCoD4xTEWg==</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOtnYgLBzZ0o9bZ0LSTs2S+AvyCZJnbjg+dd7w+gUxUDnvZCo0n8C7XU9rhLHngweg</encrypted>]]>&CommandWhenBalanceBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI6FkIk8XSExM9lBejhiqEOVaoGjev516x8Oe3BIufijq6z6s6Aqz540JaYT/vW8VWkedbbfmCUsZ7bYa02uut8p9meW7ICPkQ0cwPVAbEqqwvz0GvYtzfaiECnDyeLusXzcmRcGs3pRJ45u2T2qLhLXRQqLUrjXB6gjREBCN8WRMkGBbqSJ1bXW/jS71c37qI8ZZZyGPHeG0Nyuk5axvv1FooIwFsf5P5ivrjtTSj98W4alcrW8XW7swnMTePqxC9xaY4Jgu753OWrSjupfNkJDzH/vFEf2Y4aiiPG+gCCTzTCe55u7ByhIyxPSAD/OmzEx0nnXMnuesJEvixL5xp69ZYdRDKlcFEQSpetlRnFvs+zofyEhgH0kbAd/CsB2FWIOhxjs/SxSqP7hR1Q0q25yrmiFsGTIICjy0XCSjOQ5z3z9ClJgBBsVOhEiq0a0fBcsMnMsjgVv59ZiQQmsCxUk2LJm8UM1t6uziFYpz9EjDwWZIpjPLecD2g0esz/YOzgFRXg6p8aXEoXZUKUm//0q+WMCM21Kqnb0Iwv46wmXcmOPCASl++dq2Z3KWDciX6g==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK6vRm09t9j7HQnFuuOykf8tyXCr1eir6iVFB8BR4uuPmgLiJC7zohKr9NXxN/zvweGbzUezMHEs4WCxpxz5RotrjyO8EJFQvIPg5UxVQG2D9di4jkJJdPx68fJTZmefOyG0IUpXJLs2EGm8GzSEr0I9k7hD0xI0FHKGo3tJTpyrz+ksIdJ6pxnIoPyO5CZwzndOkdr5v4AdnUT15ojOH7OLl3lkmYTvdgju8nmMgIOYbkzfJvix4brQiHK/2s/g/eoTvO6F1fNOTUJ5Riro5/0d</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jPX+9//UVyVOvGC9jzOM6owXXKF2kg6MF5unCSLP/tuZ9CEBSf2JUzbldrHz6M0Va5eUPL26pgtd1+wGSPWXTjahsieT3eK5HGFQyAwmTbd2Fh/F5IaId97rtL8rq3qw78auCIn8imMPB8j4c4x5nlJ5RDFWo7Maq5h1xOJ+kpWSJJ24b0fGbRLfHissaS2V2ZrAaFFwIb3jhSSYtNS/rpF+D+ZZniAEnWUkahGvKK1kQTLwgyY7pQVnphyXoDC+Q7YL3x8tVfFTVANdMlj6DrQIOoXS4TkAFY1w7fEvhCw3cY/IEtX2/16Hp2IWVbsjnq91nFkdCc1W8qc6C2KaTsQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbeoJ+DOf3ngC8YWY8utprm/FUDXW2R3LN70Al5xHlFXlymhwOyeG3G0Cp+WR2c3au9w==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfysEz0KvRMQqepvz7Xl99jZxdMjZqmSu3m2Y1f8HxlRAdUcsaY0176ksLlycXPMUrG503TUJqr8yaEwX1K4kEmaTaBjhLQPTer9BxvEBFBFF88DTU2hhFgDUM0bkA2rvTjL4wqIf5fbw/9vcm5CLoY9duPQL6KvSDo8b5vdamyEX/mqfoJ52dYUMBOTuPA6kFPuCRTU4xoaSX3/3aVomxK38oarCuRx88nIy7uc3dVmDiuEIe3Hly0NM/onAlGqty5T5pi4/nxT2oR4HBE/mcwHdalVgsk9SaitQjD5lDDkJ</encrypted>]]>
      </text>
    </command>

  </commands>
  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MXf2pTwrDzOTQp2pRGyZE7+LPAkPosDVq4yolxRp3fVgOvwe+yJhzyZwfgtnZ5wk10ubhK05IEHw3PfG+p+PdZAMHc61vYXB+6wVrJCwKObKqV0xfyorkkjXoi8ljADjXdKFwcTBqZP8eRzR+5ycKz3UOPksd+StrfWHB9LQu0ONgGnIBLgv8QBKT4Xf1ikuN96og5IvtmonyYh8JYzpmDklpNRRAcRvr6k/fofVKtDdzSPkrY62f7suiW3EhQD2KQKA37oGF4ynSJXD/u0xak6Lg3+EDempjidHCVKfh8A</encrypted>]]>
    </text>
  </script>

</dir>