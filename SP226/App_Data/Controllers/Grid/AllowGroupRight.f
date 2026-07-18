<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY FilterCheckAccessUnit "@@admin = 1 and user_yn = 0">
]>

<grid table="userinfo2" code="name, id" order="name, id" filter="&FilterCheckAccessUnit;" database="Sys" xmlns="urn:schemas-fast-com:data-grid">
  <title v="Nhóm người sử dụng" e="User Group"></title>
  <subTitle v="Cập nhật phân quyền truy cập cho nhóm người sử dụng" e="User Group Right Maintenance"></subTitle>

  <fields>
    <field name="id" type="Int32" align="left" width="80" allowSorting="true" allowFilter="true">
      <header v="Mã số" e="Id"></header>
    </field>
    <field name="name" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Tên" e="Name"></header>
    </field>
    <field name="comment%l" width="300" allowSorting="true" allowFilter="true">
      <header v="Tên đầy đủ" e="Full name"></header>
    </field>
  </fields>

  <views>
    <view id="Grid">
      <field name="id"/>
      <field name="name"/>
      <field name="comment%l"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNZw2n0WoT0+pjVaOfn4TYenDc/nCKLpUK8rrgLqKRl+eJaHTsFhFt/+o7vq0ykXXsKMgPkLZTnFdClr+cQvrci3g/DgWUlqCsuZocUhhMea</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcGT4fS9SO5MTl2CowIw7X5b4Hm6zJh0+ti8VCAsJGxaoJnbXrQic43FPb/O0ivOxctDVYpRoQu9qRFV/WXPf29U+C4zLimJHOlJYN329b08/</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtTeeoaIOGdr7f9hj91wudVO7j1gbbhQ4Mww2LKyKjksrzqWAGGFa3c09iI8B9sIGHxKOOWlam0GZEtQM5nWkH5l0O22PBeo5L7ZGpiyqWS5S+0JQBexuAzUNcCHz+rlwS4fFgd2dZpM6kKDVyOkk7LRfACSwQBf4tW5UI6pBHVS/BUSoJb180Ewn/8BFzW1Se78NtRDHCbHr8zK52BhkroPif1b9slSy7EAmga1oNE/pkEiMfAcGJtsOeXMENOZ1ixP63cdICFV49QIo/f16R2s=</Encrypted>]]>
    </text>
  </script>

  <css>
    <text>
      <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu7x3hzVjb+R6o+3hwXnmae14JAkAufuEojlgYrzY6gVLLIF+0R030DpWClvBbmneyDjQUmbZRj2AxXs9ZNoetXHe0AKOXuriOmtkeKb3R13xhn3hcA4DIEkJdYloH4N7OELFxRRlRi18HpahJKGbyviaoM99iEFGQUZcRPkkw5R1Ri1SFKLMgsE3WcrnhtCVXLSgJibUd2rDAnxfLntdZ37p0zY1DBme2wazKTzpJcuAs5npFLZTMScjg4Watgm2zw==</Encrypted>]]>
    </text>
  </css>

  <toolbar>
    <button command="Edit">
      <title v="Phân quyền (Ctrl + E)$$90" e="Toolbar.Edit"></title>
    </button>
    <button command="CopyGroupRight">
      <title v="Sao chép$$75" e="Copy$"></title>
    </button>
    <button command="Separate">
      <title v="-" e="-"/>
    </button>
    <button command="Freeze">
      <title v="Toolbar.Freeze" e="Toolbar.Freeze"></title>
    </button>
  </toolbar>

</grid>