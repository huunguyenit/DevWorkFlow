<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
  <!ENTITY CheckLockDate "
if @@view = 0 begin
  if @@action = 'Edit' begin
    declare @d smalldatetime, @$lockedDate nvarchar(512)
    select @d = ngay_ct from @@table where stt_rec = @stt_rec
    if exists(select 1 from dmstt where ngay_ks_kk >= @d) begin
      select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa số liệu kiểm kê.' else N'Check the stocktaking data closing date.' end
      select 'ngay_ct' as field, @$lockedDate as message
      return
    end
  end
end">
  <!ENTITY CheckLockDateBeforeProcess "
select @$lockedDate = case when @@language = 'v' then N'Đã khóa số liệu, kiểm tra lại ngày khóa số liệu kiểm kê.' else N'Check the stocktaking data closing date.' end
if exists(select 1 from dmstt where ngay_ks_kk >= @ngay_ct) begin
  select 'ngay_ct' as field, @$lockedDate as message
  return
end">

  <!ENTITY BeginCheckExists "if exists(select 1 from kkdc where stt_rec = @stt_rec) begin
  select
">
  <!ENTITY ContinueCheckExists "@message as message
  return
end
select @p = year(ngay_ct) from @@table where stt_rec = @stt_rec
create table #checkkkss (exists_yn char (1))
select @q = 'if exists(select 1 from kkss$' +  @p + ' where stt_rec = ''' + replace(@stt_rec, '''', '') + ''') insert into #checkkkss select 1'
exec sp_executesql @q
select @ex = exists_yn from #checkkkss
drop table #checkkkss

if (@ex = '1') begin
  select ">
  <!ENTITY NextCheckExists "@message as message
  return
end

create table #checkkktt (exists_yn char (1))
select @q = 'if exists(select 1 from kktt$' +  @p + ' where stt_rec = ''' + replace(@stt_rec, '''', '') + ''') insert into #checkkktt select 1'
exec sp_executesql @q
select @ex = exists_yn from #checkkktt
drop table #checkkktt

if (@ex = '1') begin
  select ">
  <!ENTITY EndCheckExists "@message as message
  return
end
">  
]>

<dir table="kkyc" code="stt_rec" order="ngay_ct, so_ct" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="yêu cầu kiểm kê" e="Stocktaking Requisition"></title>
  <fields>
    <field name="stt_rec" isPrimaryKey="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="so_ct" dataFormatString="@upperCaseFormat" align="right" allowNulls="false">
      <header v="Số yêu cầu" e="Voucher No."></header>
      <items style="Mask"/>
    </field>
    <field name="ngay_lct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày lập" e="Voucher Date"></header>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZXIzRQM7w4NXbAv3zfL+Ft9oVbXA/4SNzSKQ+qT4NGEJlBVD+pUKbBqR10aVVqEijA==</encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct" type="DateTime" dataFormatString="@datetimeFormat" align="left" allowNulls="false">
      <header v="Ngày yêu cầu" e="Counting Date"></header>
    </field>
    <field name="tg_kk" dataFormatString="HH:ss" width="100" align="right" allowNulls="false">
      <header v="Giờ" e="Time"></header>
    </field>
    <field name="dien_giai">
      <header v="Diễn giải" e="Memo"></header>
    </field>

    <field name="kkycct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="307" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="StocktakingRequisitionDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="kkycbkk" external="true" clientDefault="0" defaultValue="0" rows="307" filterSource="Tidy" categoryIndex="2">
      <header v="" e=""></header>
      <label v="Ban kiểm kê" e="Committee"></label >
      <items style="Grid" controller="StocktakingCommitteeDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: stt_rec, stt_rec" e="String: stt_rec, stt_rec"></text>
        </item>
      </items>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="4" split="6">
      <item value="120, 30, 70, 110, 203, 120, 100, 0"/>
      <item value="110--111: [so_ct].Label, [so_ct], [ngay_lct].Label, [ngay_lct], [stt_rec]"/>
      <item value="11000111: [dien_giai].Label, [dien_giai], [ngay_ct].Label, [ngay_ct], [cookie]"/>
      <item value="-----11: [tg_kk].Label, [tg_kk]"/>

      <item value="1: [kkycct]"/>

      <item value="1: [kkycbkk]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
        <category index="2" columns="769" anchor="1" >
          <header v="Ban kiểm kê" e="Committee"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CheckLockDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfzuDV97rV0hS46l3/HVUxwc4YLXb54LC5NRAVsu72SeeRSdQiHflSoDEpuA5d0q2zJ2TTRQalQjGF0NtTUvc766+CakSBOupMrcvronwM1lr</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        &CheckLockDate;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyKnXBmEw6DYKI2ILG6IQpAj6KqRogg6S1iG9x4q9gXDwiS3Y8ZEjhiX0sJ4ejHI2Ycm1PJnEuMBou+dDvVyJCWa0wet3jSC+qMn9HIaA/cD</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5j0FqrM77GENhAy1dfNVYblH89K7fo1+NMJaATS0MCyJLusHa02za1wB5FL0J2pF4suHXIELKoCa5jnVXEUGP9AEAiZYwMdS4mWPyzMkb4w</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbTihtmGQDHec8XcoCrOAY8Diww1NTurvE61UC/cD7mFIqSAsH5R2GYvtzrJ6lVLC3XFVYAxdU5/AIxJglDhjCgBRgQjD/JnMlb7BiKBwKBy//whomZ6Heto5GjcHe5Qq2jyCXPeob2Zb36vEE6K2pS+QSULTgHO5+ujL3KZdjgUO4g3cZZMZGcjyldeQWbuZE1ZMeu102Xku8bfrM5akg913vlp6/8WNisd1qDFTC+PyZbSqHVjlPHureYnUoRDR2XsFGCLsHHcwXgRYbHAPT17RJWeT2+VJhVnnaSHD8qSdbojG5429vkXoCsWljGvYo9dTjSkiCs5qLh3Yb1rNjqg3laUVYDiYxTaCcFDgL8sHqWAlYhDFt2PcYvt5NdNKFtLN/QqUmozGX/l58g4Wi9XfzAgAwoTnANzNNyM0yFcMGlTI9GcIsMHwHvYAPgGjec=</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf/U9h1mMmjFbFS+pJ60UA68bGud6vLEV7UZNNLb4RLTsRPPv+ucOVE/XBkHwrc1n7+XhA+So9uDNNTklFg9h/7ecRv+Y4LF6T3zrUFd5fM/FheiU0cvbjHqmJp6kRufgdQ==</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        &CheckLockDateBeforeProcess;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4vZG8geyQX0pJ1qS7bKa3cCAodo9N1NFpptBazXYO4x6Jp4c32Qrb2Y8TpKwtfmF47tNshHZG41c25ux5IpoX9f0MtXqWbFvLtRYRHPxX7TyXXm4DZIrvm7cr5rn25dJl8tl2WKAuTVtEBCcbslRdlfeLiJSF1bo2lccIuvSS93heRoPI5LxoKDgsQ+Y9XWIgsWWGFCaN2nJzRtrYej0pLDrhtjdIglXKSTFkPGIS8sO+OFYFDYWYgbWqGs7eGiZj9Yqd76wadKxL2bgqJTkavYP79gaxC01RDYkSoRwVH2TbkT2pIaiCghx3r4ZTtrqPNRrMDOGuexzMme+AHBinbpkRazBp4fMruCSrvJLy1SIRaf3CYL1gA50pGEdqwJrDQJDqOWuscBbGmag4CihrRWuXHuQOqIY6nHOvWcUjGg0Vj9XMkZCWzvqWbM9Es9oBk19xWM4P4R5XRx+5dh2RFuxzy7wd1XR0PCdaL3itnSA==</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4ExkWKGz92KSs6jF30T115jD23xHIsy37c9SksHmcegMk+9B6qp1mL9XB/5AZxIW7QtKoPy2TzwvC5ncKVoYGehfn+i6vNJaNPjBOTdvbi4</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        &CheckLockDateBeforeProcess;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbRg56BgFlE/2hZEcm8nZv9Mg8x12m8uOttyx4q8Sij1mXsyIZ+4EiXj2uNJ3pNER3q66iI7Kmg51hOVY9ZDAqD3e+kKWw0eDzo5wkPUXZvZRr4C/2WxnJOY/liiedhu4oNHtR0hWCEGMSsBG7krbvtVawatlfiOC4RfdwL+AQyM32DYDwx6FN3ZVL/T3IFFMJ6rdGBu1WC+POWUznKqYs+YWSHufCkMI4x79GyVJsa8Qp45OzQ/s3rgXEwW+f+bz/0=</encrypted>]]>&BeginCheckExists;<![CDATA[<encrypted>%7RKJun8KUp6vpQQb7e/h7nHcxbxgISsYf+qpazgcK+DX9XiafFRke99iFEpmRwXR</encrypted>]]>&ContinueCheckExists;<![CDATA[<encrypted>%7RKJun8KUp6vpQQb7e/h7nHcxbxgISsYf+qpazgcK+DX9XiafFRke99iFEpmRwXR</encrypted>]]>&NextCheckExists;<![CDATA[<encrypted>%7RKJun8KUp6vpQQb7e/h7nHcxbxgISsYf+qpazgcK+DX9XiafFRke99iFEpmRwXR</encrypted>]]>&EndCheckExists;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxYeJYhVE/C26mJFPmE+1guh2NGW7ZIqE35F9md3xGJnfezw49rWOZic92pGgvD5NAqAEaIit6CzvboYzeOo0zkTt9v2k6ls/8pQc2iKVhyN5z6OMlLWm5ixIF3wpg9xrpE69D76+H/aqiSmprtoF0TTaZGrPP6/8k/H0SYE04ft1VeffImaAmtMcr+NAc7IFsQ5TKP1afJfTuAzGO8Y+D4oaI2s5/O5d69aAdYqZTqu7AZeJeay37tL+vZ6PLVow5KGJmSCJytu3/8gf7u/Bp9hNzDaj8iNHl1ZwURwxaVnl82EP1bRW47HIP5Rn5Sql/uR+81A2GSx8KhuRe4R8vg=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz7dev+1CwVPYJgDQzfe/TrDA2NadxyoUGkTasjlaZWfemNmfwU6rAunxYMF01onRe5k6nm/oK3tcNO0gMmGJz1eHNEXj93lRRTWrQwBVFzXvMMMAhMdd8CYfa29eUSkYf84ncp85HnVw0X8+fI1UNY0TnFvsf3ycLfEwIFxlNSXPz06oozmJ7+2DGp9lJ3YP02sqMUYsxCR/LSr/Z3Onms=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VjC9fcT0//RLaXg2kg5GRF2PhHxRbrQwP+b65XmSEh5tPqFkr9Xlqs8ERBtuVzXuifeo7qFxwKgHLNKP//JtY1A4VWF9GzICrLNDjfTu9Rk</encrypted>]]>
        &CheckLockDateBeforeProcess;
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6X1rO5yYi3HOzA/8C+8/VbRg56BgFlE/2hZEcm8nZv9MAdOlycdanF8Dwop6Fkod/W1X8bVT0QM505x5n896XxWa/Xd8/2Ghny5RhgElhZ3gqcOiWF5Zayfy9SvluNmlOugbIbqN7z/J3r+Psy30mqtRU1geXMf6PH3qb5H4KsH7ZgAJgVFe/7m930nUcQqyWl0g1CwybUHFr9vnBpVTvMGXsSAi7U7WWur1hRtC4COG</encrypted>]]>&BeginCheckExists;&ContinueCheckExists;&NextCheckExists;&EndCheckExists;<![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6f9rzvi7bFXYVxebji1hgmRSDJxTZ3FE0nR9c1jvzOXDlQtU16X4FffTCL1YkolxKA==</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70KInAnqcXJOY1YJQqLL4krjp509zGCV032qaGuLa611hpFHoGyHRSGq2hYNzI3hKVljpBIrOpJZ3kV1jMRtR6XfIRmybdt/HAknZmk0pFLD9QVp6gkNWsZeXfW/3OgqHuEeBeJAPItosWxZ6NNa6FArBeB0kDDTIfTQcsijQ1t0s85/F0JblBrTA/GU6I5lwPuB37n/UZ3m2GAcVKo7fed0MPf/9EC/K1TnRlUkN3g+fB+H37vIo/aFpl08eql8CH03Nl63AwGcYMBG19LJm9L8TpQU+vY1d2qE+MUVS6lw8tAtzYono0vYpNzL1KruXnH+79viK/gSUc8or9KtsG6geywYKkmhd7fvFXykfd7fWvENhOv4Ymo3UeJkR4jamRsekPYOPfMDKuFOGw6HID04sKcJQqzypsI17Dq4jA7j/PIVap3sKhy+CdkPW+aU1HZBI5D9vCfmaJK8iD8FXM+5lzk/74LBjdPts1Fx5H30A9eFvfXsLwIX6QHyYiQLqN+vkkwngwc7XegMe88wJgKPhmbrCiU4iECQ5s5oSig3PKrQvzMA4I/XUum2pHf263efr6FnnyI9WrZ1qddZzrbI95/wjX8B/i47fGNouecvtiomEPRZP9i2WWplmGHse+xcnotOt7v+GTIZf8fgYuSwvZYHkyFESEfTPMmWNhHIgegkEE6zviNvXZuhl/P57/s/EhfYjoMItjNfUz/RH5N0vHIh0miWIsSgUStYHvrgiISu8aEv7ioVm8JIEdNamUfh/sFnKCCsP/amNIa8iNps=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkb9tDbknUQvQWcp314n5wg8JjNGoGgCbbnCvA1g97fYV6w8iAdOPoIEdF/x2PHl5xhtJUqh8Mqh8WRlCN/JVJf33dntYfCdJxpM6AzEjkZszKTooC7Rf5NdfOIEGXjiYwm4mkSplf+r8TTy6bTnfvrZ1IqjESfmclX5//hI0yx9QCeKoystwPbuu5d9d7ljOqbw3BnGhMj41D9leeNSRNpJrOUqYQFoKw8ZGpSYYWNOxaNQwJwi3rFpb7sxtSuPavNMo2+gFyTB+Xh14chD0VuFFKC8UIJqTLpIVW18rQ0phxsZWWlL60jz8dnrkkVMPk00FllkNNUKewPW6U1RRhLESO6+OSqwlAQ8PzRWe+VflTgiJexiiGjpBu5M4pNL2c/eOaENCs06tlR4tJg12rY97W497WIONOUC/7dDqRyWZCzCufLTzFCJctEyvFxBzF+sLaahWJ9MffafhooPkvodqcUQ1DTkBaAimTkLH4OdYjGtisvz4/qVvq27GNE8axCe8jO4WTIS0U9g2POPy3MZ+m0nCpa+EpFHSynVyRhrHtg+9m6h4h7zc53/BYzeYZ12DIis+ESg/dGd9DQmL/tZrEA7rraTYyFA+oU1+0XHyzYTyfNOO+dXL0mJl8bRNVJWJWBvuSxlYESHiKnBZVfIIWBDkTRxGxSBTOlQHBgXlvr7FM8ge0XwSoIiAUuIi8Ti2k1wV0YT4RKCrPsX4bkv273462yVhaXOFNsp8ANjJg3isSxkTqPHDM+eZZm3MTOQ+m8X5n6si5zn9BNe0VIpEbax/Qy4jlK47g/G+R1CKfH3hg9w1vgv9KF/j3ZF3GiDeMvvYIkGzUzUlBgL6XNBzaySXkNU2VigjEbjUgtHDAx/BzfYnWhfVhpGcPYdd4zdBAwjDcpEt12KkJUNwz4QH9FE9IavVTAfDkgx2OoDB8K4v+CyczdzmJWreWazmVQ=</encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>