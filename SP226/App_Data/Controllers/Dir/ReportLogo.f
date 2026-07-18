<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ImageUploadField SYSTEM "..\Include\XML\ImageUploadField.txt">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">
  <!ENTITY UploadTyle "ReportLogo">
  <!ENTITY WhenUploadLoading "
declare @fid varchar(15), @keys varchar(15)
select @fid = replace(right(lower(newid()), 16), '-', ''), @keys = replace(right(lower(newid()), 16), '-', '')
if not exists(select 1 from upload where user_id = @@userID and type = '&UploadTyle;') insert into upload values(@@userID, '&UploadTyle;', @keys) 
else update upload set keys = @keys where user_id = @@userID and type = '&UploadTyle;'
select 'this._userID = ''' + '@@userID' + ''';this._fid = ''' + @fid + ''';this._key = ''' + @keys + ''';this._db = ''' + '@@appDatabaseName' + ''';active$FormUpload(this);' as message
return    
">
]>

<dir table="v20logos" code="logo_id" order="logo_id" xmlns="urn:schemas-fast-com:data-dir">
  <title v="biểu tượng" e="Logo"></title>
  <fields>
    <field name="logo_id" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="logo_name" allowNulls="false">
      <header v="Tên biểu tượng" e="Description"></header>
    </field>
    <field name="logo_name2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    &ImageUploadField;
    <field name="filename" hidden="true" external="true" defaultValue="''" allowContain="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="110001: [logo_name].Label, [logo_name], [logo_id]"/>
      <item value="11000: [logo_name2].Label, [logo_name2]"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [filename]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &WhenUploadLoading;
      </text>
    </command>

    <command event="Scattering">
      <text>
        &WhenUploadLoading;
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfx0TKzd6yL2BlhLuCXsLiYLCYP7Fl1PwIxt6APbuB2n6Qyp/ILZRhz50/37F0YN58GZa+U+mFLrfN4pq5/Z3Oi8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70HxsMzlj4/+fNkHBNyveLQ8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%dUxtAbG76hDnHEpXdcWHx1ZOemHcPYVW8AyOqtIx/J8dPfZkzTdCmoeb+nNRUQsnmm9NeCKv6wa5SVKqhQ4qoMTLIGCBydVMFAqpoDtBg2Ga1YCOqUPB5vMF1KtCVnw/7/ipR9kWWrkXzhz1VWO46Oh5BpUz3M0fRduhOfFL4N+F/v7t24rAUJ7AAUIG3e95B4quLhE8ovFT6p8AdiY2eJRFgm4H1x9ENsxJupAdeKCC3d2s/aOZ6uqRf2wwYoJI</encrypted>]]>&UploadTyle;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV2A5eGAdKSv37tX4J6WQFQGYwZlHXBUeOON2FLE9UI8oA2gFsFVyKPBS0LrBIJ4qVXIS65+nq3cOT4PaxnZMogAxV5Cw4DtVhHLy02ukzLKx2xbeorQdB/uGUXM3rit3p78/KCAu5AJ3KRKYeJcnDP9mnviftrPGbXHaOY0HXCfUWP+afe6cfM9/V057Y317XpCmvlIzEjwwGhQ1Z+hMFKc=</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bmcC9DnqVXSzDoHF38ZsCy2igONhO81rhLZvPBH/C16SDbls5u4yI+8Uy+xWwUG6WU+04+EFbj/oWHWfeg25vtWO4wk/5OrL/tOVBxZDUp1</encrypted>]]>&UploadTyle;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV+dgf5gDs3xLushNAzslTXV3OMyCEmfl/NBF6RgTdwsmY8pmhGv7Qj2Qb7xxLok3orrUUP8ngta/o39qHfw9f6nyjF2qUHWZviaFq35lylTDr2c+Up9gSrMv0gVsxIe0AJ6ROsYjlX2EBPiUqW9VIXevP1iXyDdZATi+Ktk+8oVMsFWj0IBws+Z+mDb6yI3vxA==</encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VMGnAuG6TZuGi7IHA4qURqb5MuiIPUtActJgFUc5FCyIYHaEyujsuISl4PLsgnmrlLzoBGXvQN8GnWAIh5G7luwutBy1+8/5j7rLmDigX1diFcCLKCzM11qKPc1qmpAbP6TXuSx+nOAFjNgtFdzpVYEmQx87GeSYeHlsUlyQijimmuIyHW8Aqx2jUXOlf89UUhSqvP3cpFo2Hxe44WNRvgic48oG40ugE3zW3M00/WETlqz627W0Dt4K0ZUj4X8NwcnFRF6GQ4O40m0bdcdE2kZQOmjeVDeHbN17HxF79qj/tJ8EZcvI99EB5XRvQ0OChQA1vt0VRChnSyplvcYoa4=</encrypted>]]>
      </text>
    </command>
    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6AV2m8bLVesUEa17mg8ne87vHZFos/9wukgz9olxNslOTq9iAymM+a++aO95kbUzTmzHH0vpr/Gyb5Xd4C4Sc4=</encrypted>]]>&UploadTyle;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyV+dgf5gDs3xLushNAzslTXW51FsFMYwWofUgS6UCJss8fQibiRie9BHcKT37CHDv3K6mip+J48k5lrpLTMm0mlc=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70DNjlRRxXODq1dr4AawaYxzz5M5ppT9l4zH/VpmVDvHIqkldRXJDa4z6qxu59YNXGNFf5IMQJDtAlcCFmir7mOcQgiAcsFqSU9SRZP0b+bm4KAYjsI9DgubBsXVTvquJzenwy64atUxIsJpHZJZ7It391QvJ6D4J5YT1LMjAIGmYIc7xxRnbOVz0EJOGkzvKjQ2ml7XO/+b6fR0jjeUc5I5+Shz5UzRsGZqz6Ev2S6/R5mXGQ7h3238NvpE/yy3i42Va1TYwjNFU/5XUF70o/GDlz/X6xd4eN7xTuR1v+oHDOFWtscxFXgsMak784zIA8bLTUeZHriJB7KtjD2yEisXo/Q9iYYKIggtalVWErZFlDKM+ox/Au3dWkHqedps0Aqco3yGMNrSHxfJWd4tnyWq/PKYkFG6LF2mU8VFOjFjmikrie4zWtKVVtW5XEo7Q5A==</encrypted>]]>&UploadTyle;<![CDATA[<encrypted>%tQIWXAkmAd+Wv5oPcBmyVyQbPSE6UcgRo2PP9KAGqouOfiCp17DOt6rM7FTc9ACOgTXJ2A3agSyHpILxPeE7blw5EfGpzNXmtchtpBsR6iH9uqRXcMCQmNhWKyS2StNcQpZxlhnP/JORBvoM9rez5EDntvWpdZycNCNl9xQ88qZMtN9hAfYJj98ea10pY2x7y/fUqSxfZnnHGKKlAN4WeA==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70D5KuartUlzgIgbFxe3RCkb64M2pNVY+wEagNWCW+PApLuLaqgQZCp8AoyBhVicSz1dbbzEsypVGSo+fjwnvwI+UEuX0Tjrwci9NKu5rF2lLVqnXenKgUbbfQXcah9D2915RDjZiFU2ttvgfhSVz6fvf3NoxAkKGmgsP3jAySDYKSCFfd3HQRXCudCx/siFbxwLT6D+QlD2QLtPNOd2coH+FT718k3q+0I8mn45dPJm4kxuFyFK3uJYL8qoxlibkMgU2nYPTg8vLG4eKURlfaIiKcYOgAyNagOVg772d+/RRnZZF+iBkKORgnOQMogRbCSotNawxlxLswpPDmys4JSfAdqLvXDz2vrl6qwRqgupHF/cihuvf6x4fv2u8Tx6xnUKSTSNL3w+UYRVs9soaJ3sC3NiPAbxh+om5bm12tayKXerlarGEzdbMqubM8qmaXNHWC47RwLhPg0HLNhPvO6tNaiUAcR41FQo5JErrzmAJLX+Obycl6XwHZpD+VUBoZQ==</encrypted>]]>
    </text>
  </script>

  &UploadButtonCss;
</dir>