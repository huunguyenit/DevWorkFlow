<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY CommandWhenBeforeEdit "
if @@view = 0 begin
  if @@admin &lt;&gt; 1 begin
    if @@action = 'Edit' begin      
			declare @$checkUnit varchar(32)
			select @$checkUnit = ma_dvcs from @@table where ma_dot = @ma_dot
      if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkUnit and r_edit = 1) begin
        select @message as script, '$NotAuthorized' as message
        return
      end
    end
  end
end">
  <!ENTITY CommandWhenBeforeDelete "
if @@admin &lt;&gt; 1 begin
	declare @$checkUnit varchar(32)
	select @$checkUnit = ma_dvcs from @@table where ma_dot = @ma_dot
  if not exists(select 1 from sysunitrights where user_id = @@userID and ma_dvcs = @$checkUnit and r_del = 1) begin
    select '$NotAuthorized' as message
    return
  end
end
">
]>

<dir table="hrrmlich" code="ma_dot" order="ma_dot" name="cookie" check="true" xmlns="urn:schemas-fast-com:data-dir">
  <title v="lịch kiểm tra, phỏng vấn" e="Test and Interview Scheduling"></title>
  <fields>
    <field name="ma_dot" isPrimaryKey="true" allowNulls="false" dataFormatString="@upperCaseFormat">
      <header v="Mã đợt" e="Recruitment Period"></header>
      <items style="AutoComplete" controller="hrRMPeriodInfoInput" reference="ten_dot%l" key="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_new = 1)) and status = '1'" check="(@@admin = 1 or exists(select 1 from sysunitrights r where r.user_id = @@userID and r.ma_dvcs = hrrmdot.ma_dvcs and r.r_new = 1))" information="ma_dot$hrrmdot.ten_dot%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVPmCXiF9BPZH639FeKqxTa5lwYKyLXto+3Ee+cId+llAvo+SJwitNdg9rj0AFBszQ==</encrypted>]]></clientScript>
    </field>
    <field name="ten_dot%l" external="true" defaultValue="''" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="ngay_tu" type="DateTime" external="true" defaultValue="''" dataFormatString="@datetimeFormat" align="left" inactivate="true">
      <header v="Ngày từ/đến" e="Date from/to"></header>
    </field>
    <field name="ngay_den" type="DateTime" external="true" defaultValue="''" dataFormatString="@datetimeFormat" align="left" inactivate="true">
      <header v="" e=""></header>
    </field>
    <field name="dien_giai">
      <header v="Ghi chú" e="Note"></header>
    </field>

    <field name="hrrmlichct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="307" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết" e="Detail"></label >
      <items style="Grid" controller="hrRMTestInterviewScheduleDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_dot, ma_dot" e="String: ma_dot, ma_dot"></text>
        </item>
      </items>
    </field>
    <field name="ma_dvcs" disabled="true" hidden="true" inactivate="true">
      <header v="" e=""></header>
    </field>

    <field name="cookie" external="true" hidden="true" readOnly="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir" height="367" anchor="5" split="7">
      <item value="100, 40, 60, 100, 137, 100, 8, 58, 50, 100, 0"/>
      <item value="1101000---1: [ma_dot].Label, [ma_dot], [ten_dot%l], [ma_dvcs]"/>
      <item value="1101: [ngay_tu].Label, [ngay_tu], [ngay_den]"/>
      <item value="110000----1: [dien_giai].Label, [dien_giai], [cookie]"/>
      <item value="1: [hrrmlichct]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHb3fo5H/YFkrmgBgukOI3tOy0odml/sEsB5FJsGK69GPVde35vGZTgVSXtYEcOs7LfbrpuuS+JzWSRZN1PplpMv9Q5CEfc8mTY/v3xdClfD3g==</encrypted>]]>&CommandWhenBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf3NRpUadENUhghGHTcGQ5B6ZBwzJ1Lv66umdAlaQgen0DUIH1YIiGLQUmw4HKnzV5Q==</encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6a6aEs9CDKG1l5LVMA32xHZqLQHvIqLTJUpo+DWhlymlb0f7glYOme62xjmIlCmOsw==</encrypted>]]>&CommandWhenBeforeEdit;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfyYk5JXxF15mosCXuRcLNTZWz3BSIGrHfpooAyOOscJC18HpVcHduMSMRX7IyeZfdP8RI7XUew4oy11fQxYWv4I=</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1wCG08Iofxvb34CPN0r8iwZKSxlZk7NXGNYK6fUWUVv6oXBi7J3PaaruW9m3YU9CrH4cwEOlCYoIciUcrFA/rDt7puZFswMud+5MrbhO7+f</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1qcXu8SL3VUGGPaCWCyzQgwX4cdlEeTGTIOm9z5P38NS54IbE/bvpSOWo3GjyyJdEC2veJSqDg+sLyfva2nEzmyRwVC1iAKKd85NDUgIP1+cub8XcZPsK4ojDWjQ97nZcwue5AconGtgQLdrmiDxXj/091TYRXhfUIyE36smJr0SGAE2sSX5BipOho1ui+6DAF4M6y51ZQLiB57Iempq+Y=</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI7lMPQHdMINJSk1a+Yh4TGBCL7MkIH1urWs9dVvTPkeV/pyo15MybS27YYbXeY6ZFFB2tVPJ8vYOZWdf631gH6Tl6RcKtguced/gnv3Kwz4QC4WSyG4MTeWHw29dZCbDR9F0pDAELk87YTD83Cz2TIieuNUt6GhytqoskSSM4s6ihoC2bSxgH5Dz5N3jOERg2bCwgqzEZ/LsRb+5GA95Ddd5Ui4lKxSvVjijejvZLTRn+HvJ+i3VBAXtExqm+Z1oBXYLb3HNTi0UjWYuqI4C6/agpyWZ2dGIP2E++SC8IscGdBtOWsaDP+18lSUd3WQIrB1nYK2gzD4Rx7KGS68Dlj0fBqxuP5mKYgROLrCfeT4n0kY5VYA1qOvCjXsgwi2c4Lb5pS3q0AfA9dfpEhFk+C68atT3BNyUIRGgEoyM5Oip5e4s1owfxsWNR5T6Gsesje+YHh82WgpPz5itnFAQ6qHd4k9NMpfVRWWhGp90RhGzZhczh2+XhBj2jx9Hj8PyHZEFPpIV0wn2QSN3hFEhppHU3L9dqGfu0hTfu2QJtnM7</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6IsMKPa23cgXDdqUfocJe82nRclgz6ExVQ5XUyxvjm1CrxTlHLIhnbF3k+BzpTPqhJfRFIu18ChednuKdzy1xQBNN8OU668ZVClVYAi0GjWRGG7WutLZeNVU77jjhYiWIWHr+Ag/yEmCfytmHnR1Tp0CtFBznTYg1FIewXaiDN19CdTz7paRseNWAxWZ8VRFgxbNBvJh08+8bJtI0KgysV1ueLaFYprIhUcXO0lxxLTPpvoyqvVFcbrboO8pqyLx61Q=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf32lCvej3ngJcODqjKq34OIq/2SegzAn6wnSLL2rZ9QT+lcNX6+sFsDnp1OTkOcTEQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6ouw6Dvgh7aSKbkNZlssBq23AWPn4uWRMlPRsYQSa/jrfEZ+Gk/sVhXZg3QKcruHPNCaZV6y2YyZK1uAF8NfVix0c8nQCQbkz7tj6sbKkRsG/Fzaux3uctq3OoXz3lg603F/RKHxLri/3AuZSuJqIz/e34OsfdOcOcaHh32d93r0c7OC58iGmsiJ6UIPw2b0D8LRUW5D2bcxyWiOEZo2gKf5CIUt1rBabipawvgHNh21Df8uZfgakvkxf6z9T52WksDffxJtRlfqzWKkr4D4/twLSod+lmcDsToxFu1RA/IL9/cRJUn66o6T63dVSf1qVYpBQpKO3o2fZTZEU84L0qiA5ZnqMUg8EAAxo1lEAZM4/5XejiYXrEX11PUi7/5Nc2ouhQHNi2LHMpQYsRD9DTcqtJwlJTpMAdx6S1aM/hIY4fakcOAMsh24wJqQ1TilQ==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2CMqgaPPfcm2MSTBcR/6V/TYEKfsfJhMjCUsexAg+fJV1wiTtTH5GQamklHLLnKpvItKiVbL1zD9e5ujW2GNOx/VI/y0JoHzSkMIq/5CR1tPADTKw3tIGmsjBORPZSCqe8RFt7laMoLjTQnJB2XMvhndGdFa6TjEPhVYPM1oCyapsCxVMlIjnu2M2X+2KNXBoGbs7GPCG4DxtXJmskq9hc=</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        &CommandWhenBeforeDelete;
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf4i6edbbbEvY4xQ4E8jy6Iu1L495VKP1gOdt4e5jUJfF6jKrE6jOJWmRmYNWJ5HebUd55ZJj9JQUvOBr+r5IKlFaZcaTx6TqnbCRdKWahILt79MSsYsMsMmVyK5dobh2AEfseZeWx1F+FoWiWhwirnc=</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6R19t5fQVBPxMsygVT/2XjVFwoaBtRxq4TIT4A8fORD4UJ/Me/rT1CfieabLgmOlXA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AxzAG4bdJ6ntszIWnWU0gVPOEkOa4XUunMlg7GlTsSTPG5IZGjMSZuDoXTQLJbwGOVMI34IUpTNATbIiQCpsvJ/lp6aZRpHykngMvGQbvm5IgeYcUgapPVWExLc9tg51bsKO0sSh8Eb6c30EZ2IFjpyMpk2cJ8jXvPifmwDYnLTfXINth0+7AfoKC6oFo5ru8n84gW6OYHf1MELN2rYqNOpRL2wAnMyTVtAKWCNtk0woyt3E/hM6VLyI/PRpfUS4SzXZkUJHZ8UhNxWTEN1q49/gaiSwMztqvrGm/7kFlfgiJ3JWmpawoVnHFzMeH/VJVg8cAAKIVMcF40WdnTaKHEuNzRiYrl7y09F+2dGu98p/sDZ4VEbqxE/82DaNKPVBXbESCk1G0/XCgGTq3jIrdt74hBH0RJfxN0r00Ifp01zCXiMY298elOt8GiVsycjXNwkKoXmHOdX3KaJidYLzd6cH3iMI/wkSAvr/QmDOERmnWqZcq8P8au6LWlRHPC5qb8UmvL3/V2YCQtuyI8OfBvxD7Wc+jDrO5b+U8gFwHhseM3sq9DNM0NNIBAkLJMG8rWpa1NJ4D2qf0ElUp9X8q+byWoOPuqRuexThWlwGjNbjUFmhc+e6Pu22vMnAYXM7RYZ3lpvlHx5A4ZcffnP+5VSMqadSyGJBw84VxSY47pig9qcVhpjKEJg2RGqa1JivpcS5iM9niFZAYekgHHuNie7l+hlS1VT7lntHTLKPgCt+yiSg9v9bEZH0OMsS5GQu9PpLijKEFksXGEZbf1TBQ9Hjg3JXLhP4vG1vbxo9waEU6R++6dYoqmcn+QUDhFr8jR/7U2zsNNrqBl6e7Ulm1Scjo46/2eey8iAefzK7ruTQ9nd9N91zKYX8XXxeuHemsDgeex9SCpy+yW9S1/yiGZ3WNYSF/DUm9dJ4j4YHLES/a6jGLvobHIxhyoABqjZinP06R9Oa/hyUv+Rzb86fhSQMw5tuCxWFjRo/iaTB2sRm1skgXFrp6PY0/jgcUAXyOTxUhvOokIzcF2n2fuOuJ+i9AqBLt0vPRAEMZgjYzNKUnLaODRVZQOnq5qKw+nK04urm68yf5ri1d6HMVy6oCOuB1OIpMTJQLFVVP7iWJJd92b6ouafuna+y6aG6j5tpg==</encrypted>]]>
    </text>
  </script>
  <response>
    <action id="RecruitmentPeriod">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK7zqNVdMJUtRMVWzWk7NKs5OB46e09OXWPdZX0yYuBWw2WvrAiiXU4aRV2vfZ1uq2ekAZjkyUu52czdG1A1fGZxwCCLkhl0danyQrWP6CDee4i7RtCNu5ur2ne3Plq7aA0=</encrypted>]]>
      </text>
    </action>
  </response>
</dir>