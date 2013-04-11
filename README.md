chef_dotfiles Cookbook
======================

Chef recipie for installing dotfiles for users.

Attributes
----------
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>["chef_dotfiles"]["repo"]</tt></td>
    <td>String</td>
    <td>Repository for the dotfiles</td>
  </tr>
  <tr>
    <td><tt>["chef_dotfiles"]["users"]</tt></td>
    <td>Array</tt>
    <td>Which users they should be installed for</td>
  </tr>
  <tr>
    <td><tt>["chef_dotfiles"]["files"]</tt></td>
    <td>Array</td>
    <td>which files to install/symlink</td>
  </tr>
</table>

Usage
-----
Just include `chef_dotfiles` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[chef_dotfiles]"
  ]
}
```

For vagrant just add the recipe
```
chef.add_recipe "chef_dotfiles"
```

and configure the users attribute
```
chef_dotfiles: {
  users: ["my", "users"]
}
```
