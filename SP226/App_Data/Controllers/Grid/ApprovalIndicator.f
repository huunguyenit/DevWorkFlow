<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE grid [
  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">

  <!ENTITY TransferID "ApprovalIndicator">
  <!ENTITY CreateTicket "declare @ticket varchar(32), @filename varchar(128), @description nvarchar(128)
select @ticket = lower(replace(newid(),'-',''))
if @@language = 'v' select @filename = 'ApprovalIndicator.xlsx', @description = N'Khai báo trạng thái duyệt'
else select @filename = 'ApprovalIndicator2.xlsx', @description = N'Approval Indicator'
insert into @@sysDatabaseName..ticket values(@ticket, @@userID, '&TransferID;', @filename, @description, '@@appDatabaseName', getdate());">
]>

<grid table="dmttcttg" code="loai_duyet, u_status" order="loai_duyet, u_status" filter="xtype = 'U'" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Khai báo trạng thái duyệt" e="Approval Indicator"></title>
  <subTitle v="Loại duyệt: %c..." e="Approval Indicator: %c..."></subTitle>

  <fields>
    <field name="loai_duyet" isPrimaryKey="true" hidden="true" width="0">
      <header v="" e=""></header>
    </field>
    <field name="u_status" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Mã trạng thái duyệt" e="Code"></header>
    </field>
    <field name="u_status_name%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên trạng thái duyệt" e="Description"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="loai_duyet"/>
      <field name="u_status"/>
      <field name="u_status_name%l"/>
    </view>
  </views>
  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf+mmpwhi9QpvaUMX+ygOTXF9bpBX08SwUjz8qbTosRCdzdGblJQ2SNvScJX31cLgbjN9fFMWb7W9dWCMo8ovPMHcX01JlhtD+eIacfllsAFU9Ngc7M8juWPi3HC+uRgmX1pybt9KNzF/yxia1JQ0dzuTXckgsQMruj7hQVYApxh23T/gUjLh2888dYC+TnG6kwCIPQVloXRHzM2cD1DTjID2JZe4SyH84jJGAk1n5i2sLZBs/8sHLMXDgmM0S+Pwyw==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%jX/slW/B4VbtC8kNBOruiEebAsH1lao0BSB+hs09Frgdk3ryNXPVMAR5Hst4c5K3oycPfqlCkb97EXXh+LTsCcg4G1NU2JuxL+aevumKx6I=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70AWYs1WMbXW4t6rMGyKy+hmYWq8aWzL4VcjifsliV+A0FHt8LTACyHeowP7X93I4njPQ4HkQopw9g+GN6XbGyl3F5G7Y4jiQQVjJ76Tm6pvEVGTKR6yzPQeRroOBAYJbxA1Vr4lX460JmUQ6+OP2sJ/LIi7+Y/977+FJzZWizPFKp7AZnDoC8D/OSyhnhOrL8ZrNWUowd81TjoVi6VBiHgJw1eBBbggwbTVRFmZDMLn8YO5aku9E13cxAPc+cLI54iCUdXF41VO+TNkpIgwgkRD5VAb6DHiJ6HkSNCgZlnlxZB0AlBN6yrQxAI4KhK8+sNPDR3WHrIs/FKDz7s18wlJfelKsdFYJLLNcSc6Hj+lMaYtg5B18SpXrP1o01isQKXNjyeItAprdc23F4GuBW5JHBRkzN7aTfrv0JruHDbzJMwVaZiGEx4EKYxPwdT1FdT+5+MV3tbLcQVmc0jcEw4XTbzSqjcS0xYoUeJdjA49eHqqztwhaPmOhp61Q0cxm6iTy4aiyjggRHEYYXGVXn+I6RP+Grs08R0M0b/J8+02CJrCvB7ZcpBjcNJfO2j2SUsz/vQXy/IHFgb/TnZk/7nw=</encrypted>]]>
      &DowloadScript;
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6ZHdyNxAoKPNwZiKsTaXEz4GRPUxY9/57uWluglpeePR5U1WuzYrYVtV5AmZ0PeC5MVgb7Xidsw19MNRH4oW+PH0v9JuYS92Wb/9Rfs2SbeLxKxV/u2UFLn+y0oIz4hphK6tzhnD2zTkAxMQL3vWpimctSEiufgOgwj4W1QR6AtH</encrypted>]]>
    </text>
  </css>

  <response>
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfz6e414K5THbJPKTpTCXK/0Soy/gsPLzbDunHmOYjOYz5znFkiGNhRte4WM40R4ZHA==</encrypted>]]>
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
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>

    <button command="-">
      <title v="-" e="-"/>
    </button>

    <button command="ImportData">
      <title v="Lấy dữ liệu từ tệp..." e="Import Data from File..."></title>
    </button>
    <button command="Download">
      <title v="Tải tệp mẫu..." e="Download Template File..."/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>
</grid>