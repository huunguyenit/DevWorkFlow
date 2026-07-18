<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FullImageCss SYSTEM "..\Include\XML\FullImageCss.txt">
  <!ENTITY FullImageScript SYSTEM "..\Include\Javascript\FullImageScript.txt">
  <!ENTITY FullImageKey SYSTEM "..\Include\XML\FullImageKey.xml">

  <!ENTITY DowloadScript SYSTEM "..\Include\Javascript\DownloadScript.txt">
  <!ENTITY TransferID "hrPIGeneralInformation">

  
  <!ENTITY CreateTicket "FastBusiness.Encryption.Begin$sp4+hMHegg2EZffLn/pV+7CT0erm8Pelc62zDbCP7bi82XzHNctnfZNnq4DaUT2uAl/q4frx8ucAGmzklj1xzZDSpAyjpeWXHC6FP7o8H3hOgMTieyQSl27334FRqJ+NkNaUT2oUS8KAu+PRxD3G2V6EU7MZpwxrcUJ7IHg0yVaQotPW1j6EwzeSZQPxWho+nIhoiw/lNHxYwqMgxi+4UIydOtKtH4bHgPUY7JIkE/OOqjdi25PEJlozkWwHZ5N4OeYk4kdRTzkHzmK5gFegv506klh2jyUX1nojWVdtmUL3LG+tfdItpP+j5YQyVK3zAT6EWbvwZRcs7iD1c7j+j38eNiqNN9GjrptZo+63rBU=FastBusiness.Encryption.End&TransferID;FastBusiness.Encryption.Begin$zUIvsNhGh4/9Y3Ut8bNJFAkX2zzhxNgY5Mi7p+EBoJzdY1foFs8S+2hNeJQliUjhMyXucck61QV8R3CeK2qq3tDa2nM+4JWI5eJfjM/y3YE=FastBusiness.Encryption.End">
  

  <!ENTITY % Control.Filter SYSTEM "..\Include\Filter.ent">
  %Control.Filter;
]>

<grid table="hrnv" code="stt_rec" order="ma_nv" type="Voucher" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Thông tin nhân viên" e="Employee Information"></title>
  <subTitle v="Cập nhật thông tin nhân viên: thêm, sửa, xóa..." e="Add, Edit, Delete Employee Information..."></subTitle>
  <partition table="hrnv" prime="hrnv" inquiry="hrnv" field="" expression="''" increase="" default=""/>

  <fields>
    <field name="stt_rec" isPrimaryKey="true" width="0" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="stt" type="Int32" width="50" allowFilter="&GridVoucherAllowFilter;">
      <header v="Stt" e="No."></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ma_nv" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Mã nhân viên" e="Employee ID"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ho_ten" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Họ và tên" e="Employee Name"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_gt" width="60" allowFilter="&GridVoucherAllowFilter;">
      <header v="Giới tính" e="Gender"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_sinh" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày sinh" e="Date of Birth"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_bp%l" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Bộ phận" e="Department"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_vtr%l" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Vị trí công việc" e="Position"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ngay_vao" type="DateTime" dataFormatString="@datetimeFormat" width="100" allowFilter="&GridVoucherAllowFilter;">
      <header v="Ngày vào" e="Join Date"></header>
      <query>&InsertCommandFilter;</query>
    </field>
    <field name="ten_ttnv%l" width="150" allowFilter="&GridVoucherAllowFilter;">
      <header v="Tình trạng" e="Status"></header>
      <query>&InsertCommandFilter;</query>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="stt_rec"/>
      <field name="stt"/>
      <field name="ma_nv"/>
      <field name="ho_ten"/>
      <field name="ten_gt"/>
      <field name="ngay_sinh"/>
      <field name="ten_bp%l"/>
      <field name="ten_vtr%l"/>
      <field name="ngay_vao"/>
      <field name="ten_ttnv%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        &CreateTicket;
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5uurMa7aZLgeXESAcEXDtW+DGH9LlUk3Ls8Xovdj7lMoHqDezVIXWT8fU7d7jjRPrYLW0vkERDexl0kn5h3SUpMUoDalUVmtWxim8c5B+mvQ/8CYnFpbaSO1H9GBuzBnlRjAnP/dZmnjhvfWy5keFBk8Yyy+ciEnSLm8E7NDrAbTVZmsunoL29hAp33++P1Mzy7zHABGk2kXKiBwCzdYaCDn8GMd7wd1ObMP83w0fmxWcMXxf4X3s6PLuUUKlo4yoDiaYMwuV9mV3Txjc3ZDovyYAmd04Ms2v47C8rFlHNCOusYqpwn1b1zNwylX9LwLmHJi4nAR4MQJhpAF1MPJOtthiv3Vm32m3mDD7B8r312Vp+wzCBDPWtznOmK5RdjJ/2HGxUJm8u1K98x6B5ZjSguqNYb6ace4F1cikY9yfx4iagmU1SWT7CcU/UvnsX/dyjnYSFhPg8XvBkg3r/Oq/Q=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcPZi8VTzgK/DoofjwU5Y6hFtGAIdJmnlN/biy/2YfuIqoOlDAIpJ6EaodCb0lWpotJtyxNgIK+Q4X5fTEsbyfgbopDGjj1uqldciIz2YAJEY</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL75zy/qs9LaksQe4G6nPXIDoXxs8kofi2V0pYu0VFXCf9Xg7Nx+A15IWLI7n1cfJxqp3Kj06iuZfDcsTcNfHvJiDM=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXUxMvTDKhm/RJNGP/l3wzBQ05oJTubt41KEa2t/ffgz3io7Kuzz1XtQJcrzO/f+tPKM8id7aIwRV4zt7tb+3k4i74uiGI+MU39+7h5qCk6eTkRt0uaYZyYvFqcYINig1gJU/V5HUpiH/jH6sTnvGbw2XsTBO057G20/Yg+4iuLknu68NI2VzVW2wtNyROFyUN7jIvesr76ipdw5vTxOIqQvsRdN1XLxC8me/S5lwkmU7bPb3q5lgLAsp3OvOL0j3K2sJ/mOKkcDLKStgTLFSUu39VgkTPHEWPcR9XtqDsRwrOtztR0CS09Q3bSG78Im7A5z79OESUCvfL2lc/pbKeq13JgtFTfpOlb+m6GhK01pvUGJv7BycgL4rFRvakjoKfx4gwqHkQP6CqweY1DMddBxw3HUHuMRdBmaXc1+j4QO+L+dFKf88JrozAtGC/FFvLVfYafz0Gkej9vU7wxLRRVeGXCe1SAIsCl2eiB+D4DZPoHCyKyxKKD0RyyQ93GsginLH9YSbVpyyrPuTC8z2LzvOdEwVLluyC6ZQ1sg3a3HiMZ6uDZ1iKr3s07R8uFyM3m/t+bpVhW2k+SqyWLcRlL4awfbTdV5IjO/tDRwVKjy1SxKPqCfH65zjyoxzb8z0Nb7BFaRf8aoBgYIGweIxIF0i/df5jZ2AsWNjG1lhmlyUPn9j4whs8lz88iXks0mKzixjhyf4ICIe/8u1f3QhILDJZDo+slHolaKPXg9Ge6hmGkQK1ITQ1F9H/olXdU2fbqqjoMz/nBuFVyiUKq0YRcjgItqkk23aS0jAr1fegVZUeJoWgAhkuvB9qsUndEMs7ATE0ONPdMlxisEgMxFNrsv5p8cVvL0o6DKrNR+csU1At1z5bX6j0e4sVx8phzhPPlIAWT0YpY8ozxZsRa8BOXGH4hLjX1ag67oYP81cP7qIIjMucxiBIUTwmRI4C0p77SLnEqEJELMJHsTBY2nANksoKM0XHGFvpO1KYjxh9i7UYCiXftYQWO0ygUfFHtiHM073G4S6LDHYNR3VfqMpP8TyDOZoIWlMWdSMRnOsk+sUrH69sNAsd6LF+IcnLWt9T8ppnpijhjB2ybHYDkFWuXVlaFxuGH+yTpzvbfKq1Iq9JNhzIG18UzAAE1rLrFvWhU20UX3iHUwgHeQjMz6LHVk0dnK/6pJTtqHVFiil/pRTj4LtQRVyqlnc0w6H2wqL/p6RiQ+YdamMkhGTfjGbcpKSwMjjXxknm+zGtPouXuQwa/455sW3/LFl/6N4UtbAoDOGspW+qDHOZyB9ZPKyVmNWrUHnD7uPngtKI4MarkkKjyRdMliT79cetDJIOfIKRknrz137YM6A+yJ8Jm/jdaFa0pnWRnE04iK+ILKu7iY1P0q5ATOSlXrM7d5cDB0csxgIDJXxxD3aXYsyNeuwRKr64lX3oVeJHe65+ZvKFL53Iq1hjzXvIx2NG5QIhM/fWRjlzMwVL6sOOvP7AGkQP7bF+S5zhjmLiWyKtslrwDPxP+6acC/kHXNpU0rAiRHS0IFzIE5PqwVME77WiMv2Uy7C2NiZ4xhTfHpL6yLEXL4</Encrypted>]]>
      &DowloadScript;
      &FullImageScript;
    </text>
  </script>

  <response>
    &FullImageKey;
    <action id="Download">
      <text>
        &CreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  <queries>
    <query event="Loading">
      <text>
        <![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4XMUh404GjjkeOxcVCJ3ssQamU7JYOCsPbHKj6I7P3Vtdi+WCr1rzdJgnHDKw4vTxrwwaCVmA3JhFoQGMuKn3W6NaQQo2OVsR1gc7rvMBOvtrH4MR4hIAPcXWj+Jx1gMwglC/oYOALNbVfOPFwC11M9FexYXvuqCIwhi5tGR6XN9</Encrypted>]]>
      </text>
    </query>

    <query event="Declare">
      <text>&DeclareCommandFilter;</text>
    </query>

    <query event="Finding">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6sWafR1HfL2PG6xuQUS668g/FjT0b4Gz9mEPk/5J597XDWnVUwJvW8Frz+jnTFLXFY33AeI85mZAuoYwmtfhRW7VZtveeoQsQ8wDNZTOvtfqBnaE4k0bQbxlPd7aVgMW/rmqJC5LP9PoBtumhkxGM8LRVDlcbmlOQ/D8NxzrS9BPHNM9xpvZOmGegSyEOR+KEYjiSmIsXHRF2yn6Gv0/gMbxXr9zziTMZTVm+DNLonBY1zxSxmGiJ0svsm4LdN5tOSuRa8Ek9yZ9/VAlDd0tGrhLdri/j7PF5hvoQnbnes9WypS9dWtX/r8KJjyIt1XXfkZcvdShnlGY2qsfSkhwviZJ+rZAZYr+zdcoR9FQ2az4mT08uMbWS19CPHa364Cp85oOjXzsLkpfdcUUtXx8mVYy8HEjSvyjOnAgp69y4huJQC4HxQBhLF2OFSh1M8mCoQ9HOWJ4OIxtDuEK0UqM1hpqayyrz+DEFj1NdbeJpqzq9NjvdoIP16zcRXAqeYdOkIYIDf7fPJvmJHorpwQb1XbPeQ7ng63nlR3/EkGQWQzbDFYKCZohGJsMS4DtLR5bvspbZDBTMElvkBHbb8TVZPgPAC9RFRfjGowJUSosX+V27M5nPyN+IqatZoFBMMRK771WNk6K8OHMwAjah2xrP2HHKVYM/LwW5uW+teA5LMZL40hpuQTnz9TZnRuJ11FjgcBp9ZJfJ5jQndu1aRX4QBhrJBaUVoAN1F355YeWjO9gwgFev1rjmS/CC7f9sWjX6BSLRQMQ1qAkEV3AStkca/UStTSUYq4JbHugMi9vhZr5P/zA7sgC8w/Lbi85YQxcEw71iAxLFn37sZPUULXIKu5do2f/rA+YW29smVm9E5QsBtIw2uLKeh6GVBo7O4Ivb3cyrgOM4bzPNM14/AzzOQZ4KspV7E88WS66Nx8nSObQkgfJTY05PywylGCZHgJlffsna3NYWcDheyCCx6n6tSyDbjrDL6oMMISIC6X0mZMRy+bBjCYntlhGAYkh8iXWc8pstViejU3oMkCGaWa7UHyp6vP7F3JIWtVcscIV5KFf+oUvIPWlTAF8Vw2gtHbnuBZP9pnI3w2Ofw19b4kpycOuGdJ78wfN3dbAUBKxfGJ1pvmzuraBX2eoDZcPYKuZh+HCTUCsYb8Zxrkl+QawxsETtPtjPNQQs6ppSnKlcBCXZt0x0M/wNn0CdIjXbvmSAK1tBeITJ0gLhIFc9whNEkYLnnX88cdfk8ue3yi3/aBnONyWUcP9aob1LZNEYrNllPcqxuc6ACtcyqS+NqpYg6bm8MBQonH8LEZ7xie8ZKMxeVUTzYIeN/197zfLrBY/goKlkr52Yrnub+M64SAWqnb7HXOAsQNy9JHcCsqShhTHNdy4AWyJS9w574Z1AeJwGDtdwiHIxyOxuxPSTctENnUR3iNkBdtRNmIN+rWVgJ9rRlHj1/282Rs4c6LDHMq09/y2yb+/VuOqIuFLNNyqcEFp9zDHg7+uulzY3t2Htpa</Encrypted>]]>
      </text>
    </query>
  </queries>

  <css>
    <text>
      &FullImageCss;
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9gbWKtb3JNCLthnEXvMfEb+eFnkPeaSvjo3zac2JfAPN+EoN4ImSiUA9j2rob6l57awPEkqWA0sJ+Vjf7U7kEOCHAA7wfA+1WBYbR2Xk3mvpu61YFkLzjT1CcqNl3RbjTU4rrjr/xhe5iOnfi4IzDkV7knLWAp8B8SktZzc090cOy+tPIjYcJF5gsodu8F3FPrAVzcyKS50rAVs1kpvznfZ2IV5oJfW9Gtv+xSwjVeFxwP2696YDSrqrdMd83VXDg==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"/>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"/>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"/>
    </button>
    <button command="Search">
      <title v="Toolbar.Search" e="Toolbar.Search"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"/>
    </button>

    <button command="Separate">
      <title v="-" e="-"/>
    </button>

    <button command="CopyEmployee">
      <title v="Sao chép nhân viên$$120" e="Copy Employee$$120"></title>
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
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"/>
    </button>
  </toolbar>
</grid>