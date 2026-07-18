<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY JavascriptReportInit SYSTEM "..\Include\Javascript\ReportInit.txt">
  <!ENTITY ScriptTagReport SYSTEM "..\Include\Javascript\TagReport.txt">
  <!ENTITY Tag "cast(0 as bit) as tag">

  <!ENTITY CreateTicket "declare @ticket varchar(32)
select @ticket = lower(replace(newid(),'-',''))
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', '','', '@@appDatabaseName', getdate());">

  <!ENTITY Key "declare @rk varchar(16)
select @rk = lower(left(replace(newid(),'-',''), 16))
update @@sysDatabaseName..userinfo2 set rkey = @rk where id = @@userID">

  <!ENTITY % TransferData SYSTEM "..\Include\TransferData.ent">
  %TransferData;
  <!ENTITY TransferID "DataCopy">
  <!ENTITY CommandCheckLockedDate "
declare @$d smalldatetime
select a.ngay_ct0, b.ngay_ks into #scsl from dmscsl a left join dmdvcsks b on a.ma_dvcs = '' or dbo.ff_ExactInlist(b.ma_dvcs, a.ma_dvcs) = 1 where exists(select 1 from @s where patindex('&#37;,'+ rtrim(a.id) + ',&#37;', text) > 0) and a.loai = 1
select @$d = min(ngay_ct0) from #scsl
if exists(select 1 from dmstt where ngay_ks >= @$d) begin
  select 2 as value
  return
end
if exists(select 1 from #scsl where ngay_ks >= ngay_ct0) begin
  select 2 as value
  return
end">
]>

<grid table="vdmscsl" code="stt_rec" order="id" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Sao chép số liệu" e="Data Copy"></title>
  <subTitle v="%s" e="%s"></subTitle>

  <fields>
    <field name="id" isPrimaryKey="true" width="0" hidden="true" readOnly="true">
      <header v="" e=""/>
    </field>
    <field name="&Tag;" type="Boolean" width="60" filterSource="tag">
      <header v="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Chọn&lt;/div&gt;" e="&lt;div onclick=&quot;toggle$Grid(this);&quot; style=&quot;cursor:pointer;background-position:3px 3px;&quot; class=&quot;HeaderArrowImage&quot;&gt;Select&lt;/div&gt;"></header>
      <clientScript><![CDATA[<Encrypted>&96EB7KSJ4WpQv9tz7CWyJbtHo3Q0hC+ZW+BSt29RDWP80Vcedfyf9uv/1yggap7nO4MFdA1VF5YBLaFiF/rXPQ==</Encrypted>]]></clientScript>
    </field>
    <field name="ngay_ct0" type="DateTime" readOnly="true" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Từ ngày" e="From Date"></header>
    </field>
    <field name="ngay_ct2" type="DateTime" readOnly="true" dataFormatString="@datetimeFormat" width="100" allowSorting="true" allowFilter="true">
      <header v="Đến ngày" e="To Date"></header>
    </field>
    <field name="loai" width="80" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Loại" e="Type"/>
    </field>
    <field name="ma_ct" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Danh sách chứng từ" e="Voucher List"></header>
    </field>
    <field name="ma_dvcs" width="150" readOnly="true" allowSorting="true" allowFilter="true">
      <header v="Danh sách đơn vị" e="Unit List"/>
    </field>
    <field name="status" width="0" readOnly="true" hidden="true" allowSorting="true" allowFilter="true">
      <header v="" e=""/>
    </field>
    <field name="status_name%l" width="100" readOnly="true" allowSorting="true" allowFilter="true" hyperlinkFormatString="~/AppHandler/View.ashx Query: {Page: 'query_scsl', Controller: 'DataCopy', Name: '[id]', Value: '[id] + this._queryFilterString'}, Script: 'beforeDrillDown$DataCopy(this);'">
      <header v="Trạng thái" e="Status"/>
    </field>
    <field name="ngay_th" type="DateTime" dataFormatString="dd/MM/yyyy HH:mm:ss" width="130" readOnly="true" allowSorting="true">
      <header v="Ngày thực hiện" e="Performed Date"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="&Tag;"/>
      <field name="ngay_ct0"/>
      <field name="ngay_ct2"/>
      <field name="loai"/>
      <field name="ma_ct"/>
      <field name="ma_dvcs"/>
      <field name="status"/>
      <field name="status_name%l"/>
      <field name="ngay_th"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHf9VxG7TkhTaBtRLHsRddgeJQqMZVTsZs4W29Zl+I2GqOmmr9UqinTAT5kvZ2rKq3etNyX98PTjdeAARauLXPA=</Encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &CreateTicket;
        &Key;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPccmCg3miZkjX0SX7JW2Dosgh5cUQUNVVk2QUkSu8PYMoEV1mcqsGR8Nfa8C5v8pLAHE7UpY82P+bCbj0vCWWzrJfa89DXYKLUfESB4RlJzJsR3S2mb+KQZ7lfiENoRQemlKsQfOkrDtEvZAOBaivk=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFKvjuPmFP28V0XIguONEHyHAxgittBauFoeZamfZbnXYogEUvqarUlDtEnQTivYjdw69VbyyX39ZXGOdM73SjPT6jryjEzpqjBslu/mM4FcWkdluYBgncYs8KMwOrzVjJBc3isgAYuFm4zrE9I7aruI=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL758FqqnKB3SEYOg/Qz+yjr8iPaG86vSLQtOIrnsmFxh2G+2UhsQJ6hXc/CvJMtkFs7/BhD0kOX5TluRI80/1yibc3zZr+Tz4QbKNOxHQxDlPR</Encrypted>]]>
      </text>
    </command>
    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75ymtyW99MDOuhUekZt9uT78ikk9b1xhrsXTzfCswY+SnbvrIz671oYMgyYnTPfuMCKzOZP1qQjwtmRd+NOBvMmg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22fyZ7FSJOd5E836kG5vLjWEQ5erV5ptg3kw8JsaNRFgMFGVlfW2gmHAsmqG7huMjKh8juWzB7aA6FIUIcZm+RndW6SGAdKw3LO2ILFxzrOPyRDTJfewihuJLmkaAivUwBA==</Encrypted>]]>&Tag;'<![CDATA[<Encrypted>&FWLYPF8C2HGF+g3sOQXFyfA2aQ5tj5uNgqPI3z27XttXV0QTqcJVdWzIRO/ggAAkcY5RaTOFGHff3ZtUI0tR2K/VhONhLZvJ0ZrBcxSPQCMEn4ghOeJWuii4LN/d7kl7i1ZlgUk1dAyuDghu6pknAv1tBePnC2j0DcCe9Phe5jaqMtVrrrKfw+n/7LXFbdKsL+noWThdqgibuaO5s46H31P/DNdsuxCmQtGQ/xNePtSw6Q34m7MlWIjmUCSoQMGYJ4ts2uPEq83onU4X72CoUvI2MFLE0jgP8SODqrLa85LkE9S3yW3THJjJ2xwkK6boywn6ACIBxPUqCN2/otUU610ENQENKRuvBYrvd8rrV3m8/xEq/K3Z8sQaWR2t3DyDTqJIn59A83jN9rsmdXMtZzbq2wB89ujyeEcP3TSSc0GD+0Ej43A1jUxJyrjXJDMc2ZJTLapXuyc/G+oP7c44Kn20XzKqVOtLft+Z0GTVGk3CtHDVbEJFJku+GCSOx+Qc</Encrypted>]]>&TransferType;<![CDATA[<Encrypted>&CrF+8fgUMpf3VN9TIlgkxnPZwmFXmhiGr4iF0V6sJxRIdF/m7f+8iJ2nJpJbGjE7/tvHBgKToWVzYL9NPuqDMg==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&CZT/ABV6lnPaei3qIp0xPBMnX2DegnuUXaWPAO1T/95luxvqpmO2smWKcT09PL5cWy8uZm2LYrSJiTciEjqnT5KC5tboLnfc3YJk5Jexq1Q=</Encrypted>]]>&TransferType;<![CDATA[<Encrypted>&CrF+8fgUMpf3VN9TIlgkxgUQysjQzrxTIQ7jWgYnb/Mp2+EyAx+uA/fLB9/6k2H0yQtFZMtI6IMBRSKeR0UsmubJT44xiIw49e3PuSlcswCqxUdRn7nc7wT6p21kLgOUC7mchsjng8TxVCaY6NN7Ltz2tqFumEis794czflxxDVBulFXkQHu5prTUbY0APTXT4Af0SM7UH9/vcEmB2KZYIhuAF2FDlKARBo/6p+wKkbfakSeKsuCf9PgC+460yOGGjkfbyWD6UIVW24WOnqyyLtPkGL3sI06cv5Fm4nud/43LiZOOGptk80mN4ilEGeA0GKUGpUec/IPyq/XtVL3N22kruP1WIq0qDKp4eEPAeugouyauGm2PlJHNjW4i+phO/PB7hZnVVZ63TOunZHsGQh2BpJMeisaGswb/QUiQglFW75Mm+bKVMye5kbazA90B4HwYEJLCdRgax+fnoBMdKFdIwO52lXiB/9rN4cyc3H/e1vwmR2gRASZwwfT3eqemiAikrulfTpxFgH6keqyjCdowSxhvHJiH0FYwQO3hMz4TptSq1LCySq8oX1gB+23WT42pMw//EqOKD+zgcxSPvMoPtHqCO824V230cwSgFzTTmRcoqAtrfXODhiPbh8R4+EB5pF1Kcgzxz9bR5geS5txdaQA64nC9UeS43I0AGvN/OnyQifVKDB8v28j48zEQdqYdndhPsu2GvG4hxMr1QBUTl1Jvh+tI3sif5y54kxYU1l1MLI+TeGIyCjZeP2DT2Ae3O/THUKe3PhuzycjAyTyCLDT9WJ9jyMbJtQ4j5abaX2Bp2pIpEqjKXDnpQqLS/Z5cFwD2YVzvp74GDqLBn7pxCo0r2kvM2jNZNMlXD3EvOeoL3TNHfyNYH59EcQvxxWGaCpu4oyuhA0Qt+rcYUfuTt4WzLKsdaZ9+oqQqUW5PnoE/LT/+7nyXxSWkhpZ9zjko89g0LTIgKIltB57ExFzkRHNJ6psX+B5zHwvaYGU86lL1DCPOWxxteDom1LhK6lnisCM8Ux+6c4yeuMATIiXrBJl4z4AHtqujoeG1C8C+pLu7KIF9mXRrSEbKXgecDYiJ5jXF2514oKCjvxlds0mfO1+YWxq+ywFlAg4H5v0RBSrIU99/MV0kzS8a2s6ukQyRpmGqEx39i224Ya5Jf01OEdiqs0Mcloxvr4XILI=</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&jwCf/BTlrU+uAQRWsW8lQhP+UaS2VAZ5OkZGOcLMT2pcBa7WXyEgxWgB8lnrmwAe+r0V8x6FbBdwYCuV4+27IYCeRCAK3yk0k5UPbRwOo7jbtpv7pOlvgyGaNhOyyQBC8NuLP7dVrLuAnEnDSPDib4esb+mv/RGHhl22QaKGjz13tE70CvxbLpx3g8VY1LoldIeYnfK5p7gYkshKFam2Vsu7yAOg1YWhSxzF5IBdjsIk8V6jR6HwsKN20cDzLZ2xQRP3dfyP1tpjYT0AftkWZyYdlXm+3CJGZxo2PvPAlGtsd5cLVAqGCyfgePQSjKetyOh74uE5Pv3Ixo78uO9Knd6RE/yaq7Xz3W2XsCDN67aegr1L+X/xtnAlSLI5zbm8ceTwh8MTuuLLe8n3RKdxUtqoJ5PHg4zqOb+bXWpekeGkOpKIamKIGkmOK+89sbpenucywF20V5SMNOoruFfcMIoUzD8b2IQmvHTEn2g8/X8=</Encrypted>]]>&TransferType;<![CDATA[<Encrypted>&x51xGhsaILnd6OtdJxQo/acAgfmZyz/7YtJ6mCEmTazUCa59eW0UjjSXoqfBcVObEg9oxKF8q5VzB85CNspm7BubLnUdNJ3l8BPQgIjlDP7YIbP9VZPBq2gvoT0/7nInYPEu9acMxUsTuIQail47wz94adW8qhCS/UV6Mq/n2xZkcRPKuKtOHAsaXGaEgrGY</Encrypted>]]>&TransferProcess;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5WrEHYR7Q587AuascCkrIaZH4ufI31sxjKZMCjBJrF25DAZYmX+kLs9faD8t+kk6QXDdBNZOaKzfBEzR16KJSza8ZDTJLSLvM7cnAGtLpuGF</Encrypted>]]>&TransferProcess;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5YTign8+/+JmbsZH73yUAXUALq094R4cUhEiSkgtcfBlLXVoKJTAcjVMBjIarDLhVN6WVfxGR0XJmbgd/DRW6J2w23i0zhafxkntsGTRjzQnhsso4elkw4GCghW4+wIDi6HciDj7lwFCpExv81w5/9esJlr/D547ooDY6v5EQ/ggoe5D9FvFskdwxOzf6toCwcubnJS9xq7H/XpTJ9OLzL1VVBwCabFdexM3IWE/CW1z0/IFPPqnlj9Ej2JMVBB/7oghi3jRKnwNUv7kX0k+wg77tD3lyhN4A3lO+yGVtAzUhc2YwbahxEVbrcYS8N12Wz7lHkyQd9yUinC2o9MEQKTrEytUuhfkcvZgKCD6bsPtQfU7XonpRwOYmGZLFDK/UjgXhpuMAcEaxlRo8gdnO7wyAIYAO4y3R29cY2rz4NEZq8CKvtKMdzQFgyXdraqT31NNfSZJuWkE+KAWQm0ngpktrOAJjdwPHSv96qwKbQU4yYlfTH4CinVFS+tTk6Ky4RjXqm3s2+V7SKZYpz2l1Gw+g23kFlfi0osSP4mlks9gJlSL138RmLA+gaTEDF7QmAgRBUmSK7ri9WE5WKmIikIxEAcJEuDi7LdiN8QFjpoM+i27jC7LeVixglkjg0AKfA==</Encrypted>]]>
      &JavascriptReportInit;
      &ScriptTagReport;
    </text>
  </script>

  <response>
    <action id="Calculate">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuypxWhbJCJPtHgNnuGu1+0iPZYvq59yfH0l8Wj2/Yn5edgpu6uU+ToiGiR2lGXQnys0rmsgoZB4c+BAE6v68DtYSFeTWNF85t0GrCEMuNZNemJbaCUWma7scSQvk369lPPub+f8VNYc4FvWmn26WbtV593LqUWQOOTQUKpix98NWMo+nAP10PN57NERPrOR2uuxp8sDTAcsetQgao7PqlR1+RR4An5k27k0XDT6xou/2</Encrypted>]]>&TransferType;<![CDATA[<Encrypted>&J2TBvpO21RqtngekCjGcywkYxucvGI9x9QUlboFdIEKosfw1IHm26tt/gB4TkcTnVK+OCG1snh5E8mR/XVxC9e4qQHYlCeAEmL+jws+bH1my0lAggn/G+WTu3CaAo8X5</Encrypted>]]>&CommandCheckLockedDate;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcG21uZWnSB5OE7IRiG0sOZVDEa+AX25zC2R2M5AMrS3pH5WCQf9zhINARPTXK7aBjMKeNeS6H+QzlTgFBM8rErIkl66v9EeSp89HUiMYOEnKQ3n37W7qq2wYNX9W+n1z03pojJ9/Xg4RxcqlVC1noAfIhb+CKujoSfPPewwpmqpTvwv9D+446G0J1LzxeGLAKA==</Encrypted>]]>&TransferType;<![CDATA[<Encrypted>&ELpMQkN6t0HjBmQ7qOIUZ/S5p0q73qhvfD262fgH6YpDY0jTDgzuPFc0WvQg+gsvcHXxqih4T/ikfu1O1cCAz8WasSkMRRGthKai1Fe5u0A02abpO/BXBHOOhgADk8tl4KUwcU+g6wTphJyS4VFxo097ieJ62TiNwOI0Xggq5hXfFzN39/tWjmA0j9QF7tVS</Encrypted>]]>&TransferType;<![CDATA[<Encrypted>&llgzMN40HdLatD7EB/4D0fMnAchZQU5OodxKtnXd4BXlPQcKvu0WlS6uk3iNU4lfgx48D9Ggd24490mkUWccrg4/bOMxQaujoCdS5aGeskE=</Encrypted>]]>
      </text>
    </action>

    <action id="Register">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAHMA4J5Hf2xZJK0jJeghm53UfrUVyXdyqGJ7qWed1aIvYaObvVQVEy5bqR84hYvy5MObCa+gs99gnlscWC1Kh2aIf+MU8JEfMz/zc+FA9G+UZIwmRJN9K6XRfWQsg3BsDXidPURlVOpeCDhNMO9rvJTCrg2Tl3rJ+8EgqJYV74DUO40HJ6GuskWIyMbtF9zwaVmu56ULCFlrX5Xv1+ulzHCuKWPUVPXDp2OTOAd//0V</Encrypted>]]>&CommandCheckLockedDate;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2sCFnaE6bsbLaYyxT5S+2skaaUuf8HfN/TwbYipcMnqJeqcVarzgvl+DxxgVCFy8/oeHoN/nHWnRAEjlPddBZUaNyK+CPsS0LwGb7aGOLLKLc7IMJ2CNvK6S/Hzh07yf5Myn8LHVn6r3OqQ4jYlvCtXCN8ajDf8FcmP3i3HZejlwMTG6x111iogSsAVAJC4787D+GXgNmzQN5HeeXw5ybE=</Encrypted>]]>
      </text>
    </action>

    <action id="Cancel">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu2sCFnaE6bsbLaYyxT5S+2uv2QC9BdaO+/50iA9hEuBF17pXGjBjdy7gVRl0eJm1WB0hppY435DnkkiNZI0wAZyCBpR1fuXPI0saetpjPSOS3dBJhuCNyU15pESPFQRJ9a5mj8dTPakszrTgkA9A341jFF8LtEE6tkG3qfJN//U9nhPwhqTLBbmOLEuvgNq2RXmujXf/Sg9Ov3tsCLDNoXA=</Encrypted>]]>
      </text>
    </action>

    <action id="Download">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu57T4PcXRvMbsOHckmf6v3x0T22hMYvElWJ4AkHIn+qA/8qi2p1lwhaaeS7Y0MYt6PARY0IIZIMXMAroVVuWovuQU5+Kn51j8WLumAays5soEuYUZH/RSsmU+zfdzqJ/biwkkUDLC+NJV0HlC+3VvHHRbZwwR4fVg85GX2lYk6hemY8nUt6dqliNtjJ96SHSinLfE7lNbMoWg8+trQiyFLQZV9Q3y+oxoe4l9DuXfNLgK2bCPRiOMq/pdiAekfPIv+6fhMPJ3vzml3oLvT7sgwB0NNWWIdij09zhvb75MQX4zkGrXABNQrsYaGtiraKFWj3t/pb2GxBdtdaKXvCxbZPQ3llKwCoxXnqnwIafTlBjI8yNPmRlFKB3/uPgK7s4WQ==</Encrypted>]]>&TransferID;<![CDATA[<Encrypted>&zUIvsNhGh4/9Y3Ut8bNJFJ1hD+/4kMjz/2qiECiX++vkFzPyPZtIXsZZ8liTPLB6sBKJTWSiHwmTT8Zjdwp3YVPDwlM6RXjga2OhzT2rdBVuypViHdY4NpAvLJfA0IVl</Encrypted>]]>
      </text>
    </action>
  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ViewCode">
      <title v="Xem mã số" e="View Code"></title>
    </button>
    <button command="Calculate">
      <title v="Sao chép số liệu...$$90" e="Copy$"></title>
    </button>
    <button command="Register">
      <title v="Đặt lịch" e="Schedule"></title>
    </button>
    <button command="Cancel">
      <title v="Hủy" e="Cancel"></title>
    </button>

    <button command="Upload">
      <title v="Tải dữ liệu từ tệp..." e="Upload"></title>
    </button>
    <button command="Download">
      <title v="Tải dữ liệu xuống..." e="Download"/>
    </button>

    <button command="SeparateFreeze">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7NsKIJCB00pcJRrdyWxnlioF/oTVtdbhlKK4aF1gfDBWTabOU21Mf5mdtr4d0pSO+qIHBQjm86AAUuKMXl8X1TINfBXu1D0SLg4c8n9B/XvLZ5Zki4/3oiXCGlTyeYspOJgG/i0yD6V67TNBKG536HGL3i6tGhZigrBtaS04Rz8hfq2lQrOyzj8T88X4E4wlnjIG0JzVifH7FgCVFxy1AvcDuNiuRd5FJ0yPWDJRKUcYbEO8MYydTksLd7LZzIlsflXvUrWnvhcvz+5ZOwRVsRTsQo6JA+xU+/etRz52qfoBJR8YXOwBr7C7ZKC+4apGE9zy8OtRTcApq3fjeWKrYw=</Encrypted>]]>
    </text>
  </css>
</grid>